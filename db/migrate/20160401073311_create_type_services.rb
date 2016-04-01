class CreateTypeServices < ActiveRecord::Migration
  def change
    create_table :type_services do |t|
      t.integer :type_id
      t.integer :service_id
    end
  end
end
