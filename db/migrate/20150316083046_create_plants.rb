class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :race
      t.integer :age
      t.integer :height
      t.float :temperature
      t.float :humidity_soil
      t.float :humidity_air
      t.float :light_degree
      t.float :health_factor
      t.string :image
      t.text :description

      t.timestamps null: false
    end
  end
end
