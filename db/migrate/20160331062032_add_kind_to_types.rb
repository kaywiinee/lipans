class AddKindToTypes < ActiveRecord::Migration
  def change
    add_column :types, :kind, :string
    add_column :types, :image_url, :string
  end
end
