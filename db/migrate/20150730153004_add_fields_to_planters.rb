class AddFieldsToPlanters < ActiveRecord::Migration
  def change
    add_column :planters, :latin_name, :string
    add_column :planters, :second_name, :string
    add_column :planters, :germination, :text
    add_column :planters, :plague, :text
    add_column :planters, :keeping, :text
  end
end
