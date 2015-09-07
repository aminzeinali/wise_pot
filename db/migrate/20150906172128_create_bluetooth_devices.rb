class CreateBluetoothDevices < ActiveRecord::Migration
  def change
    create_table :bluetooth_devices do |t|
      t.integer :user_id
      t.integer :sampling_times , :default => 0
      t.string :location
      t.integer :version , :default => 1
      t.integer :status, :default => 0

      t.timestamps null: false
    end
  end
end
