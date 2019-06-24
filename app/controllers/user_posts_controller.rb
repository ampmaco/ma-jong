class UserPostsController < ApplicationController

	before_action :authenticate_user!

	def index
		@user = current_user.posts.all
		@user_posts = current_user.user_posts
	end

	def create
		@post = Post.find(params[:post_id])
		@user_post = current_user.user_posts.new(post_id: @post.id)
		@user_post.save
		SampleMailer.send_join_group(@user_post).deliver
		redirect_to root_path
	end

	def destroy
		post = Post.find(params[:post_id])
		user_post = current_user.user_posts.find_by(post_id: post.id)
		user_post.destroy
		redirect_to root_path
	end

end
