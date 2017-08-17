# :nodoc:
class CartsController < ApplicationController
  before_filter :authorize
  def show
    @user_id = User.find(session[:user_id]).id
    # @quantity = Cart.first.orders.quantity
    if Cart.find_by(user_id: @user_id).nil?
      @cart = []
      flash[:danger] = 'can not find cart'
    else
      @cart = Cart.find_by(user_id: @user_id).orders
    end
    @book = Book.all
    # @book = Order.find_by(cart_id: @cart.first.cart_id).book
    # @cart = Cart.joins(:orders).where('carts.user_id  = :user_id', user_id: userid.id).order(id: :asc)
    # @cart = Cart.joins('orders on orders.cart_id = carts.id').where('carts.user_id
    #    = :user_id', user_id: userid.id).order(id: :asc)
    # binding.pry
  end
end
