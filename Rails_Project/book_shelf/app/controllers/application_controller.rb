# :nodoc:
class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  # helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
