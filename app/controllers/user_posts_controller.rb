class UserPostsController < ApplicationController

	def index
		@posts = Post.all
		@user_posts = UserPost.all
	end

	def create
		post = Post.find(params[:post_id])
		user_post = current_user.user_posts.new(post_id: post.id)
		user_post.save
		redirect_to root_path
	end

	def destroy
		post = Post.find(params[:post_id])
		user_post = current_user.user_posts.find_by(post_id: post.id)
		user_post.destroy
		redirect_to root_path
	end

end
