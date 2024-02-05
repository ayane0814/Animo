class Post < ApplicationRecord
    has_one_attached :image
    validate :image_attached
    
    def get_image(width, height)
        image.variant(resize_to_limit: [width, height]).processed
    end
    
    private
    
    def image_attached
        unless image.attached?
            errors.add(:image, "画像を選んでください")
        end
    end
end
