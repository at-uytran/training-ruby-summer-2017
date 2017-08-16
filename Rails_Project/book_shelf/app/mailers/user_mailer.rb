# :nodoc:
class UserMailer < ApplicationMailer
  def wellcome_email(user)
    @user = user
    mail(to: user.email, subject: 'login success!')
    # binding.pry
  end

  def account_activation(user)
    @user = user
    # binding.pry
    mail(to: 'vanuy113@gmail.com', subject: 'login')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  def password_reset(user)
    @user = user
    mail(to: user.email, subject: 'Reset Password')
  end
end
