class Post < ActiveRecord::Base
	belongs_to :planter	
	mount_uploader :image , AvatarUploader
	has_many :comments
	belongs_to :user
	has_many :comments , :as => :commentable



	def to_param
		title
	end

	validates :title, presence: true
	validates :content, presence: true
	validates :image , presence: true

end
