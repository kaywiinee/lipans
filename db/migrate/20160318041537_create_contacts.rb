class CreateContacts < ActiveRecord::Migration
  def change
  	drop_table :contacts
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :subject
      t.text :message
    end
  end
end
