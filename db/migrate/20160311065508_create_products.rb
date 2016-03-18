class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.integer :type_id
      t.boolean :is_best
      t.text    :description
      t.text    :use
      t.text    :note
      t.integer :price
      t.string  :image_url
      t.timestamps
    end
  end
end
