class Planter < ActiveRecord::Base
	has_many :plants
	has_many :posts , :dependent => :destroy

	mount_uploader :image_1, AvatarUploader
	mount_uploader :image_2, AvatarUploader
	mount_uploader :image_3, AvatarUploader
	mount_uploader :image_4, AvatarUploader
	mount_uploader :additional_image, AvatarUploader	

	has_many :comments , :as => :commentable , :dependent => :destroy

	acts_as_followable


	def to_param
		latin_name
	end

	validates :name, presence: true
	validates :latin_name, presence: true
	validates :brief_desc, presence: true
	
end
