module ApplicationHelper

	def can_edit
		@profile.user == current_user
	end

	def has_auth(comment)
		current_user == comment.user
	end

end
