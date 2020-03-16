class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:top,:about,:sign_up,:sign_in]
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	end

	def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end
end