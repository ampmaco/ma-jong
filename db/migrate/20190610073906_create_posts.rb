class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, foreign_key: true
      t.string :group_name
      t.string :prefecture
      t.string :region
      t.text :description
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
