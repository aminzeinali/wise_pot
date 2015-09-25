class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|
      t.integer :profile_id
      t.string :name
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
