# :nodoc:
class CartsController < ApplicationController
  def show
    userid = User.find(session[:user_id])
    @cart = Cart.joins('INNER JOIN orders on
      orders.cart_id = carts.id').where('carts.user_id
       = :user_id', user_id: userid.id).order(id: :asc)
    # binding.pry
  end
end
