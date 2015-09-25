class CreateComments < ActiveRecord::Migration
  def change
  	# drop_table :comments
  	
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.text :content

      t.timestamps null: false
    end
  end
end
