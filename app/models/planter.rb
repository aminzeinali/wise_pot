class Planter < ActiveRecord::Base
	has_many :plants
	has_many :posts
	mount_uploader :image_1, AvatarUploader
	mount_uploader :image_2, AvatarUploader
	mount_uploader :image_3, AvatarUploader
	mount_uploader :image_4, AvatarUploader
	mount_uploader :additional_image, AvatarUploader	
	has_many :comments , :as => :commentable
end
