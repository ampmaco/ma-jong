class PostsController < ApplicationController

  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def new
  	@post = Post.new
  	@posts = Post.all.order('updated_at DESC')
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to new_post_path
  end

  def edit
  end

  private

  def post_params
  	params.require(:post).permit(:user_id, :group_name, :prefecture, :region, :description, :status)
  end

end
