module Authenticable

 # Devise methods overwrites
 # def the_user
 #    @the_user ||= User.find_by(auth_token: request.headers['Authorization'])
 # end
 #
 # def authenticate_with_token!
 #    render json: { errors: "Not authenticated" },
 #                status: :unauthorized unless the_user.present?
 # end
 #
 # def user_signed_in?
 #    the_user.present?
 # end

end 