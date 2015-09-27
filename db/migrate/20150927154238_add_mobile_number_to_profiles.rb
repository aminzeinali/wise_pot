class AddMobileNumberToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :mobile_number, :string , :default => "0"
  end
end
