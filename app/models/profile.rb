class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :gardens
	mount_uploader :profile_photo, AvatarUploader
	mount_uploader :cover_photo, AvatarUploader
end
