class Post < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    has_many :laughed_buttons, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :tags, through: :post_tags
    belongs_to :user
    validates :image, presence: true
    validates :posted_title, presence: true
    validates :post_content, presence: true, length: { in: 1..140 }
    
    def get_image(width, height)
        image.variant(resize_to_limit: [width, height]).processed
    end
    
    def laughed_button_by?(user)
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
        
    end
end
