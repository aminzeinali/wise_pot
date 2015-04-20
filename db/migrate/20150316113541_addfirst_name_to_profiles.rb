class AddfirstNameToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles , :first_name ,:string
  	add_column :profiles , :last_name ,:string
  	add_column :profiles , :gender ,:string
  end
end
