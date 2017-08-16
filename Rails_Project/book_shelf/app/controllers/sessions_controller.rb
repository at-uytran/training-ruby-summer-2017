# : nodoc:
class SessionsController < ApplicationController
  include SessionsHelper

  def new
    session[:user_id] = nil
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        UserMailer.wellcome_email(user)
        log_in user
        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user
      else
        message  = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        user.create_activation_digest
        user.send_activation_email
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    # session[:user_id] = nil
    redirect_to '/login'
  end
end
