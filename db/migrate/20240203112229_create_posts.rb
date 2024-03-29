class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :tag_id, null: false
      t.string :posted_title, null: false
      t.text :post_content, null: false
      t.string :is_display,  null: false
      t.string :address, default: ""
      t.float :latitude, default: 0, null: false
      t.float :longitude, default: 0, null: false

      t.timestamps
    end
  end
end
