class SampleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #
  def send_join_group(user)
    @user_post = user
    mail to: @user_post.post.user.email,
    	 subject: 'あなたのグループに新しいユーザーが加入しました。'
  end
end
