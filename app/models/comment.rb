class Comment < ApplicationRecord
    belongs_to :notification
    belongs_to :post
    belongs_to :user
end
