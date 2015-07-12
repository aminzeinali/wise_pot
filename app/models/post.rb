class Post < ActiveRecord::Base
	belongs_to :planter	
	mount_uploader :image , AvatarUploader
	has_many :comments
end
