class AddFollowerIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :follower_id, :integer, null: false
  end
end
