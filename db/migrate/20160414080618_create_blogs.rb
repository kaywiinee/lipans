class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :type_id
      t.boolean :is_displayed
      t.timestamps
    end
  end
end
