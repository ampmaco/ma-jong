class JoinsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		join = current_user.joins.new(post_id: post.id)
		join.save
		redirect_to root_path
	end

	def destroy
		post = Post.find(params[:post_id])
		join = current_user.joins.find_by(post_id: post.id)
		join.destroy
		redirect_to root_path
	end

end
