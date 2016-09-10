class UserMailer < ActionMailer::Base
  default from: 'sample_RoR_app@camjam.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to my sample RoR app")
  end
end
