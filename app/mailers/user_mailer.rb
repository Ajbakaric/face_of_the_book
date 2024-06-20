# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'no-reply@faceofthebook.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Face Of The Book')
  end
end
