class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@example.com'
  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'ご登録ありがとうございます')
  end

  def receive(email)
    page = Page.find_by(email.from.first) ||
        Page.create(:address => email.from.first)

  end




end
