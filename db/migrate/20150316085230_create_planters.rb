class CreatePlanters < ActiveRecord::Migration
  def change
    create_table :planters do |t|
      t.text :brief_desc

      t.timestamps null: false
    end
  end
end
