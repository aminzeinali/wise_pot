class Plant < ActiveRecord::Base
	has_many :plant_on_gardens
	belongs_to :planter
	has_many :images, :as=>:imageable
end
