class AddColumnToPlanter < ActiveRecord::Migration
  def change
  	add_column :planters, :plant_id, :integer
  end
end
