class AddImagesToPlanter < ActiveRecord::Migration
  def change
  	add_column :planters, :image_1, :string
  	add_column :planters, :image_2, :string
  	add_column :planters, :image_3, :string
  	add_column :planters, :image_4, :string
  	add_column :planters, :additional_image, :string
  end
end
