class ChangeGenderTypeInProfiles < ActiveRecord::Migration
  def change
  	remove_column :profiles , :gender 
  	add_column :profiles, :gender , :integer , :default => "0"
  end
end
