class PersonMailer < ApplicationMailer

    def signup_email(user)
        @user = user
        mail(to: @user.email, subject: "Hello #{@user.username}. You have successfully signed up.")
    end

end