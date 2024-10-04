class SendLetterOpenerMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    PersonMailer.signup_email(user).deliver_now    
  end
end
