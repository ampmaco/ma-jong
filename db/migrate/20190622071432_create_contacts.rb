class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.string :contact_email
      t.text :contact_body

      t.timestamps
    end
  end
end
