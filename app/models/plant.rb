class Plant < ActiveRecord::Base

	acts_as_votable

	belongs_to :garden

	has_many :data_logs

	belongs_to :planter

	mount_uploader :image , AvatarUploader

	has_many :comments , :as => :commentable

end
