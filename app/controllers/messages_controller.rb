class MessagesController < ApplicationController

  def index
  	@message = Message.new
  	@messages = Message.all
  end

  def create
  	post = Post.find(params[:id])
  	message = current_user.messages.new(post_id: post.id)
  	message.save
  	redirect_to post_message_path(post.id)
  end

  def edit
  	@message = Message.find(params[:id])
  end

  def update
  	@message = Message.find(params[:id])
  	@message.update(message_params)
  	redirect_to post_message_path(@message.post.id)
  end

  def destroy
  	post = Post.find(params[:id])
  	message = current_user.messages.find_by(post_id: post.id)
  	message.destroy
  	redirect_to post_message_path(post.id)
  end

  private

  def message_params
  	params.require(:message).permit(:user_id, :post_id, :body)
  end

end
