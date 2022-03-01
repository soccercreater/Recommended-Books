class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :sex, :birthdate, :age])
  end


#   def after_sign_in_path_for(resource)
#   	if resource.is_a?(Admin)
#     		admin_path
#   	else
#     		root_path
#   	end
#   end

#   def
# 	after_sign_out_path_for(resource)
#     if resource == :admin
#   	   admin_session_path
#     elsif   resource == :customer
#     		 customer_session_path
#     end
end