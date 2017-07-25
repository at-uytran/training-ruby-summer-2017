
# get '/hello.html?username=:unm&password=:pswd&signin=:sign+in' do
# 	"Hello #{params['unm']}"

# end
require "mysql2"

# class MyApp < Sinatra::Base
# 	# get '/' do
# 	# 	@kien = 'hello'
# 	# 	erb :index 
# 	# end
# 	get '/books' do
# 		@books = ['toan', 'anh', 'van']
# 		erb :index
#  	end
# end
# <% @books.each do |item|%>
# 	<p> book: <%= item%></p>
# 	<%end%>
class MyApp<Sinatra::Base
	@@host_name = "localhost"
	@@user_name = "root"
	@@password = "avicii"
	@@database  ="book_shelf"
	client = Mysql2::Client.new(:host => @@host_name, :username => @@user_name,:password=>@@password, :database =>@@database)
	connection = Mysql2::Client.new(:host => @@host_name, :username => @@user_name,:password=>@@password, :database =>@@database)

	get'/book' do
		@results = client.query("SELECT * FROM book")
		erb :index
	end

	get '/book/new' do
		erb :new
	end

	get '/book/edit/:id' do
		@results = client.query("SELECT *  FROM book WHERE id = #{params[:id]}")
		erb :edit
	end
	post '/edit' do
		query = "UPDATE book SET bookname = '#{params[:bookname]} ', nxb = '#{params[:nxb]}', author = '#{params[:author]}' WHERE id ='#{params[:id]}'"
		@update = connection.query(query)
		redirect'/book'
		erb :book
	end
	get '/book/delete/:id' do
		query = "DELETE FROM book WHERE id  = #{params['id']}"
		@delete = connection.query(query)
		redirect '/book'
		erb :book
	end
	
	post '/insert' do
		query = "INSERT INTO book (bookname,nxb,author) VALUES (\'#{params['name']}\',\'#{params['nxb']}\',\'#{params['author']}\')"
		@book = connection.query(query)
		redirect '/book'
		erb :book
	end
end