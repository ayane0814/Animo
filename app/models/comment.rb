class Comment < ApplicationRecord
    has_many :notifications, dependent: :destroy
    belongs_to :user
    belongs_to :post
    
    validates :comment_content, presence: true
end
