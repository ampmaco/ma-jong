class CommentsController < ApplicationController

  def create
  	@user = User.find(params[:user_id])
  	@comment = current_user.active_comments.new(comment_params)
  	@comment.commented_id = @user.id
  	@comment.save
  	redirect_to user_path(@user.id)
  end

  def edit
  	@comment = current_user.active_comments.find(params[:id])
  end

  def update
  	@comment = current_user.active_comments.find(params[:id])
  	@comment.update(comment_params)
  	redirect_to user_path
  end

  def destroy
  	@comment = current_user.active_comments.find_by(commenting_id: params[:user_id])
  	@comment.destroy
  	redirect_to user_path
  end

  private

  def comment_params
  	params.require(:comment).permit(:commenting_id, :commented_id, :rate, :comment_body)
  end

end
