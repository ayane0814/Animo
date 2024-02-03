class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :tag_id, null: false
      t.string :posted_title, null: false
      t.text :post_content, null: false
      t.boolean :is_display, null: false, default: true
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
