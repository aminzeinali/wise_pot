class AddAllFieldToPlanter < ActiveRecord::Migration
  def change
  	add_column :planters, :humidity_soil, :float
  	add_column :planters, :humidity_air, :float
  	add_column :planters, :temperature, :float
  	add_column :planters, :light_degree, :float
  	add_column :planters, :race, :string
  end
end
