class ContactsController < ApplicationController

	def index
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.save
		redirect_to root_path
	end

	private

	def contact_params
		params.require(:contact).permit(:contact_name, :contact_email, :contact_body)
	end
end
