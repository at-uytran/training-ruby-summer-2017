# : nodoc:
class AccountActivationsController < ApplicationController
  include SessionsHelper
  # before_action :get_user, only: [:edit]
  # before_action :check_expiration, only: [:edit]

  def edit
    user = User.find_by(email: params[:email])
    if user.activation_request_expired?
      flash[:danger] = 'Activation request has expired. Please check your email again.'
      user.create_activation_digest
      user.send_activation_email
      redirect_to user
    # binding.pry
    # end
    elsif user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = 'Account activated!'
      redirect_to user
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end

  private

    def set_user
      @user = User.find_by(email: params[:email])
    end
end
