class DropPlantOnGardens < ActiveRecord::Migration
  def change
    drop_table :plant_on_gardens
  end
end
