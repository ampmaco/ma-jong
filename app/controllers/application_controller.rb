class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


# joinsテーブルのユーザーカラム(:user_id)にuser.idが存在するかを確認する
	def joined_by?(user)
		user_posts.where(user_id: user.id).exists?
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  	end
end
