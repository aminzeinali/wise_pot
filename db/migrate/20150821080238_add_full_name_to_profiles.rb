class AddFullNameToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :full_name, :string , default: ""
  end
end
