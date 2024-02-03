class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :follow_member_id, null: false
      t.integer :follower_member_id, null: false

      t.timestamps
    end
  end
end
