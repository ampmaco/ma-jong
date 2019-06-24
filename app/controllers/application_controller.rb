class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
		devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :email, :image_id, :profile])
  	end

  	# ユーザーが管理者であるかどうかのチェックメソッド

    def admin_user
        redirect_to(root_path) unless current_user.admin?
    end

end
