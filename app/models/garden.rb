class Garden < ActiveRecord::Base

	belongs_to :profile

	has_many :plants

	has_many :comments , :as => :commentable	
end
