class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
  	@user = User.find(params[:user_id])
  	@comment = current_user.active_comments.new(comment_params)
  	@comment.commented_id = @user.id
  	@comment.save
  	redirect_to user_path(@user.id)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  end

  private

  def comment_params
  	params.require(:comment).permit(:commenting_id, :commented_id, :rate, :comment_body)
  end

end
