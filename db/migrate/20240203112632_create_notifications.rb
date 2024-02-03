class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_user_id, null: false
      t.integer :sender_user_id, null: false
      t.integer :post_id, null: false
      t.integer :comment_id, null: false
      t.integer :laughed_buttons_id, null: false
      t.string :notification_detail, null: false
      t.boolean :is_read, null: false, default: false
      t.string :notification_type, null: false

      t.timestamps
    end
  end
end
