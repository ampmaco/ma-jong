class Administrator::UsersController < ApplicationController

	def index
		@users = User.with_deleted.all
	end

	def posts
		@posts = Post.all
	end

	def comments
		@comments = Comment.all
	end

end
