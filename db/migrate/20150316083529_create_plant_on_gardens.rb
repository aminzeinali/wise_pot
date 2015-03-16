class CreatePlantOnGardens < ActiveRecord::Migration
  def change
    create_table :plant_on_gardens do |t|
      t.integer :plant_id
      t.integer :garden_id

      t.timestamps null: false
    end
  end
end
