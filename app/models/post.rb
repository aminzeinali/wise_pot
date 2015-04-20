class Post < ActiveRecord::Base
	belongs_to :planter
	has_many :comments
end
