class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :laughed_buttons, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'recipient_user_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'sender_user_id', dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/ashiato.png")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def status_label
    status_class = is_active? ? "text-success" : "text-secondary"
    "<span class='#{status_class}'>#{is_active? ? '有効' : '退会'}</span>".html_safe
  end

  GUEST_USER_EMAIL = "guest@user.com"
  
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  def self.search_for(content, method)
    if method == "perfect"
      User.where(name: content)
    elsif method == "forward"
      User.where("name LIKE ?", content + "%")
    elsif method == "backward"
      User.where("name LIKE ?", "%" + content)
    else
      User.where("name LIKE ?", "%" + content + "%")
    end
  end
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["recipient_user_id = ? and sender_user_id = ? and notification_type = ?", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        sender_user_id: id,
        notification_type: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
  def to_param
    name
  end
  
  validates :name,
    format: { with: /\A[a-z0-9_-]+\Z/ },
    length: { minimum: 3, maximum: 25}
    
  def following?(current_user, follow_id)
    Follower.find_by(user_id: follow_id, follow_id: current_user.id)
  end
  
  def followed(user)
    Follower.where(follow_id: user.id)
  end
  
  def follower(current_user)
    Follower.where(user_id: current_user.id)
  end
end
