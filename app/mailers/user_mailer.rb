class UserMailer < ApplicationMailer

  require 'mailgun-ruby'

  def welcome_email(user)
    @user = user
    send_simple_message(user.email)
  end

  private

  def send_simple_message(_to_email)
    mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
    
    domain = ENV['MAILGUN_DOMAIN']

    message_params = {
      from: "Excited User <mailgun@#{domain}>",
      to: 'wekecal665@skrak.com',
      subject: 'Welcome to HospitalApp!',
      text: render_to_string(template: 'user_mailer/welcome_email', formats: [:text]),
      html: render_to_string(template: 'user_mailer/welcome_email', formats: [:html])
    }

    mg_client.send_message(domain, message_params)
  end

end
