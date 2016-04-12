class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :type
      t.integer :parent_id, index: true
      t.string :parent_type, index: true
      t.attachment :image
      t.timestamps
    end
  end
end
