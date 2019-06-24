class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
  	@message = Message.new
  	@post = Post.find(params[:post_id])
  	@messages = Message.where(post_id: @post.id).order('id DESC')
  end

  def create
  	@post = Post.find(params[:post_id])
  	@message = current_user.messages.new(message_params)
  	@message.post_id = @post.id
  	@message.save
  	redirect_to post_message_path
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  	redirect_to post_message_path(@message.post_id)
  end

  private

  def message_params
  	params.require(:message).permit(:user_id, :post_id, :body)
  end

end
