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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to new_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to new_post_path
  end

  private

  def post_params
  	params.require(:post).permit(:user_id, :group_name, :prefecture, :region, :description, :status)
  end

end
