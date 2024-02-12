class Comment < ApplicationRecord
    has_many :notifications, dependent: :destroy
    belongs_to :post
    belongs_to :user
    
    validates :comment, presence: true
end
