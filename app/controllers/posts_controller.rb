class PostsController < ApplicationController

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order('updated_at DESC').page(params[:page]).per(5)
  end

  # ransack用

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).order('updated_at DESC')
  end

  def new
  	@post = Post.new
  	@posts = Post.all.order('updated_at DESC')
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
      redirect_to new_post_path
    else
      @posts = Post.all.order('updated_at DESC')
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to books_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to new_post_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
  	params.require(:post).permit(:user_id, :group_name, :prefecture, :region, :description, :status)
  end

  def search_params
    params.require(:q).permit(:prefecture_eq, :region_cont)
  end

end
