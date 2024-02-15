class Notification < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    belongs_to :post, optional: true
    belongs_to :comment, optional: true
    
    belongs_to :recipient_user, class_name: 'User', foreign_key: 'recipient_user_id', optional: true
    belongs_to :sender_user, class_name: 'User', foreign_key: 'sender_user_id', optional: true
end
