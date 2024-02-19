class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.references :follow, foreign_key: { to_table: :users }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
