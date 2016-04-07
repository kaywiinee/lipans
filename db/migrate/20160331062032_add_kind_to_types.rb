class AddKindToTypes < ActiveRecord::Migration
  def change
    add_column :types, :kind, :string
    add_column :types, :is_displayed, :boolean
  end
end
