class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :authenticate_user!

 	include SimpleCaptcha::ControllerHelpers
  # protect_from_forgery unless: -> { request.format.json? }

	def after_sign_in_path_for(user)
		if user.profile.present?		
			profile_path(user)
		else
			new_profile_path
		end		
	end

	def after_sign_up_path_for(user)
		new_profile_path
	end

	def after_sign_out_path_for(user)
			root_url
	end

end
