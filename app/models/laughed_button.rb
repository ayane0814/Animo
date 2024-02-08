class LaughedButton < ApplicationRecord
    # has_many :notifications, dependent: :destroy
    belongs_to :post
    belongs_to :user
    
    validates :user_id, uniqueness: {scope: :post_id}
end
