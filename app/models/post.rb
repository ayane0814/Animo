class Post < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    has_many :laughed_buttons, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :tags, through: :post_tags
    has_many :todays_favorites, -> { where(created_at: Time.zone.today.all_day) }
    belongs_to :user
    validates :image, presence: true
    validates :posted_title, presence: true, length: { in: 1..20 }
    validates :post_content, presence: true, length: { in: 1..140 }

    
    geocoded_by :address
    after_validation :geocode
    
    enum is_display: { published: "published", draft: "draft", unpublished: "unpublished" }
    
    scope :published, -> { where(is_display: "published") }
    scope :draft, -> { where(is_display: "draft") }
    scope :unpublished, -> { where(is_display: "unpublished") }
    
    scope :latest, -> {order(created_at: :desc)}
    scope :old, -> {order(created_at: :asc)}
    scope :laughed_count, -> {
        left_joins(:laughed_buttons)
            .select('posts.*, COUNT(laughed_buttons.id) AS laughed_count')
            .group('posts.id')
            .order('laughed_count DESC')
    }
    
    def get_image(width, height)
        image.variant(gravity: :center, resize: "#{width}x#{height}", crop: "#{width}x#{height}+0+0").processed
    end
    
    def laughed_button_by?(user)
        return false if user.nil?
        laughed_buttons.exists?(user_id: user.id)
    end
    
    def self.laughed_posts(user, page)
        includes(:laughed_buttons)
            .where(laughed_buttons: {user_id: user.id})
            .order(created_at: :desc)
            .page(page)
    end
    
    def self.search_for(content, method)
        if method == "perfect"
            Post.where(posted_title: content)
        elsif method == "forward"
            Post.where("posted_title LIKE ?", content + "%")
        elsif method == "backward"
            Post.where("posted_title LIKE ?", "%" + content)
        else
            Post.where("posted_title LIKE ?", "%" + content + "%")
        end
    end
    
    def create_notification_laughed!(current_user)
        temp = Notification.where(["recipient_user_id = ? and sender_user_id = ? and post_id = ? and notification_type = ?", current_user.id, user_id, id, 'laughed'])
        if temp.blank?
            notification = current_user.active_notifications.new(
                post_id: id,
                sender_user_id: user_id,
                notification_type: 'laughed'
            )
            if notification.recipient_user_id == notification.sender_user_id
                notification.is_read = true
            end
            notification.save if notification.valid?
        end
    end
    
    def create_notification_comment!(current_user, comment_id)
        temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
            save_notification_comment!(current_user, comment_id, temp_id['user_id'])
        end
        save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end
    
    def save_notification_comment!(current_user, comment_id, sender_user_id)
        notification = current_user.active_notifications.new(
            post_id: id,
            comment_id: comment_id,
            sender_user_id: sender_user_id,
            notification_type: 'comment'
        )
        if notification.recipient_user_id == notification.sender_user_id
            notification.is_read = true
        end
        notification.save if notification.valid?
    end
end
