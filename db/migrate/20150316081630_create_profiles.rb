class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :profile_photo
      t.string :cover_photo

      t.timestamps null: false
    end
  end
end
