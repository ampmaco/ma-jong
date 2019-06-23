class ContactsController < ApplicationController

	def index
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		@contact.save
		ContactMailer.send_contact(@contact).deliver
		redirect_to root_path
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to administrator_contacts_path
	end

	private

	def contact_params
		params.require(:contact).permit(:contact_name, :contact_email, :contact_body)
	end
end
