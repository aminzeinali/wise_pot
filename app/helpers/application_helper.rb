module ApplicationHelper

	def can_edit
		@profile.user == current_user
	end


end
