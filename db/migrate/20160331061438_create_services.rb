class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :name
      t.integer :type_id
      t.text    :description
      t.integer :price
      t.timestamps
    end
    add_index :services,[:type_id]
  end
end
