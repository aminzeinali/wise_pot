class AddPlanterIdToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :planter_id, :integer
  end
end
