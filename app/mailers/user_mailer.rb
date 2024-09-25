class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(from: ENV['MAILGUN_SENDER'], to: @user.email, subject: "Welcome to our API App.")
  end

end
