# 100.times do |a|
# 	email = Faker::Internet.email 
# 	User.create(
# 		name: Faker::Name.unique.name,
# 		avatar: Faker::Avatar.image,
# 		role: rand(0..2),
# 		email: email,
# 		provider: 'email',
# 		password:'123456', 
#             activated: true,
#             activated_at: Time.zone.now,
# 		gender: rand(0..4), 
# 		birthday: Faker::Date.birthday(18, 65),
# 		user_name: Faker::Internet.unique.user_name,
# 		uid: email
# 	)
# 		# binding.pry
# end

# 100.times do  |b|
# 	Book.create(author:Faker::Book.author , 
# 		name: Faker::Book.title ,
# 		title: Faker::Book.title,
# 		isn:Faker::Number.number(10))
# end

p 'create cart'
100.times do
Cart.create(user_id: User.all.ids[rand(User.count)])
end
p 'finish'


p 'create orders '
100.times do
Order.create(cart_id: Cart.all.ids[rand(Cart.count)], book_id: Book.all.ids[rand(Book.count)], quantity: rand(1..5))
end
p 'finish' 
p "create "

# User.create!(name:  "Example User",
#   email: "example@railstutorial.org",
#   password:  "foobar",
#   activated: true,
#   activated_at: Time.zone.now)

# 99.times do |n|
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(
#     name:   Faker::Name.name,
#     email: email,
#     activated: true,
#     activated_at: Time.zone.now,
#     provider: 'email',
#     role: rand(0..2),
#     password:'123456', 
#     gender: rand(0..4), 
#     birthday: Faker::Date.birthday(18, 65),
#     user_name: Faker::Internet.unique.user_name,
#     uid: email
#     )
# end
