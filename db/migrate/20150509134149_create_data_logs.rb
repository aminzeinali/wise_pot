class CreateDataLogs < ActiveRecord::Migration
  def change
    create_table :data_logs do |t|
      t.integer :user_id
      t.integer :plant_id
      t.float :humidity_soil
      t.float :humidity_air
      t.float :light
      t.float :temperature

      t.timestamps null: false
    end
  end
end
