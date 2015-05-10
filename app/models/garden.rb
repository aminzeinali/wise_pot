class Garden < ActiveRecord::Base

	belongs_to :profile

	has_many :plant_on_gardens
	has_many :plants, :through => :plant_on_gardens
	has_many :comments , :as => :commentable	
end
