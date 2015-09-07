class Garden < ActiveRecord::Base

	belongs_to :profile

	has_many :plants , :dependent => :destroy

	has_many :comments , :as => :commentable , :dependent => :destroy

end
