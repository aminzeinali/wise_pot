class Garden < ActiveRecord::Base
	belongs_to :profile
	has_many :plant_on_gardens
end
