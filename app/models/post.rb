class Post < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    has_many :laughed_buttons, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    belongs_to :notification
    belongs_to :user
    validates :image, presence: true
    validates :posted_title, presence: true
    validates :post_content, presence: true
    
    def get_image(width, height)
        image.variant(resize_to_limit: [width, height]).processed
    end
    
    def laughed_button_by?(user)
        laughed_buttons.exists?(user_id: user.id)
    end
end
