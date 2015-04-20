class Plant < ActiveRecord::Base

	has_many :plant_on_gardens
	has_many :gardens , :through => :plant_on_gardens
	belongs_to :planter
	mount_uploader :image , AvatarUploader
end
