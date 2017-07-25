# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  book_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# nothing
class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :book
  # scope 
  # scope :user_order, -> {where('carts.user_id =',"%#{users.id]}%" )} 
  # binding.pry
end
