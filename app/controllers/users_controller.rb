class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @comment = Comment.new
    @comments = @user.passive_comments.where(commented_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:user_name, :email, :image, :profile)
  end

end
