class Notification < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :laughed_buttons, dependent: :destroy
    belongs_to :user
end
