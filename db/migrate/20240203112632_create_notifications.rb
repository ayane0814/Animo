class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_user_id, null: false
      t.integer :sender_user_id, null: false
      t.integer :post_id
      t.integer :comment_id
      t.boolean :is_read, null: false, default: false
      t.string :notification_type, null: false, default: ''

      t.timestamps
    end
    
    add_index :notifications, :recipient_user_id
    add_index :notifications, :sender_user_id
    add_index :notifications, :post_id
    add_index :notifications, :comment_id
  end
end
