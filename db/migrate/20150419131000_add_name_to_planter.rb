class AddNameToPlanter < ActiveRecord::Migration
  def change
  	add_column :planters , :name , :string 
  	remove_column :planters , :plant_id
  end
end
