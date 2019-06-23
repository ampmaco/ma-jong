class Administrator::UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :admin_user

	def index
		@users = User.with_deleted.all.order("created_at DESC")
	end

	def posts
		@posts = Post.all.order("created_at DESC")
	end

	def comments
		@comments = Comment.all.order("created_at DESC")
	end

	def contacts
		@contacts = Contact.all.order("created_at DESC")
	end

end
