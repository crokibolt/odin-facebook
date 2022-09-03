class UserMailer < ApplicationMailer
    default from: 'notifications@feisbu.com'
    
    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/users/sign_in'
        mail(to: @user.email, subject: 'Welcome to Feisbu')
    end
end
