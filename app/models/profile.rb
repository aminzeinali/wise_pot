class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :gardens , :dependent => :destroy
	mount_uploader :profile_photo, AvatarUploader
	mount_uploader :cover_photo, AvatarUploader

	def to_param
		full_name
	end

end
