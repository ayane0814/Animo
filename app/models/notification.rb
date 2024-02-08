class Notification < ApplicationRecord
    belongs_to :post
    belongs_to :comment
    belongs_to :laughed_button
    belongs_to :follower
    belongs_to :user
end
