class ContactMailer < ApplicationMailer

  def send_contact(contact)
    @contact = contact
    mail to: ENV['MAIL_ADDRESS_KEY'],
    	 subject: '雀友ユーザーから新しいお問い合わせが届きました。'
  end

end
