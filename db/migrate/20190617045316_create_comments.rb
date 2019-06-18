class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commenting_id
      t.integer :commented_id
      t.integer :rate
      t.text :comment_body

      t.timestamps
    end
  end
end
