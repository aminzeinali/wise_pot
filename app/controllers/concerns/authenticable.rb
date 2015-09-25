module Authenticable

 # Devise methods overwrites

 def current_client
    @current_client ||= User.find_by(auth_token: request.headers['Authorization'])
 end
 
 def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_client.present?
 end
 
 def clinet_signed_in?
    current_client.present?
 end

end 