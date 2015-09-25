class AddHeightToPlanters < ActiveRecord::Migration
  def change
    add_column :planters, :height, :string
  end
end
