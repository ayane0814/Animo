class Follower < ApplicationRecord
    has_many :notifications, dependent: :destroy
    belongs_to :user
end
