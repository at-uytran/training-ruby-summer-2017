class OrdersController < ApplicationController
	before_filter :authorize


	def index
		# @orders = Order.joins(:cart).user_order
		# binding.pry
		@orders = Order.all
	end

	def show
		@orders = Order.joins(:cart).order(cart_id: :asc)
		
	end
end
