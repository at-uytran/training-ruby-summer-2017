# :nodoc:
class OrdersController < ApplicationController
  before_filter :authorize

  def index
    @orders = Order.all
  end

  def show
    @userid = User.find(session[:user_id])
    @orders = Order.joins(:cart).where('carts.user_id =
     :user_id', user_id: @userid.id).order(cart_id: :asc)
    # binding.pry
  end
end
