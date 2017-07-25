# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

10.times do |a|
	email = Faker::Internet.email 
	User.create(
		name: Faker::Name.unique.name,
		avatar: Faker::Avatar.image,
		role: rand(0..2),
		email: email,
		provider: 'email',
		password:'123456', 
		gender: rand(0..4), 
		birthday: Faker::Date.birthday(18, 65),
		user_name: Faker::Internet.unique.user_name,
		uid: email
	)
		# binding.pry

end

# 300.times do  |b|
# 	Book.create(author:Faker::Book.author , 
# 		name: Faker::Book.title ,
# 		title: Faker::Book.title,
# 		isn:Faker::Number.number(10))
# end

# p 'create cart'
# 30.times do
# 	Cart.create(user_id: User.all.ids[rand(User.count)])

# end
# p 'finish'


# p 'create orders '
# 20.times do
# 	Order.create(cart_id: Cart.all.ids[rand(Cart.count)], book_id: Book.all.ids[rand(Book.count)], quantity: rand(1..5))
# end
# p 'finish' 

# p "create "