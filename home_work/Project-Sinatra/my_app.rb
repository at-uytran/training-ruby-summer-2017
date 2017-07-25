require "mysql2"
require "pry"
class MyApp<Sinatra::Base
	@@host_name = "localhost"
	@@user_name = "root"
	@@password = "avicii"
	@@database  ="book_shelf"

	client = Mysql2::Client.new(:host => @@host_name, :username => @@user_name,:password=>@@password, :database =>@@database)
	connection = Mysql2::Client.new(:host => @@host_name, :username => @@user_name,:password=>@@password, :database =>@@database)
	get '/about' do
		erb :about	
	end

	get'/bookstore' do
		@results = client.query("SELECT * FROM books")
		erb :index
	end
	get '/book/manage' do
		@results = client.query("SELECT * FROM books")
		erb :manage
	end

	get '/book/manage/new' do
		erb :new
	end
	get '/book/shopcart' do
		erb :shopcart
	end
	get '/book/edit/:id' do
		@results = client.query("SELECT *  FROM books WHERE id = #{params[:id]}")
		erb :edit
	end
	post '/edit' do
		filename = params[:file][:filename]
		file = params[:file][:tempfile]
		path = "images/products/#{filename}"
		File.open("./public/#{path}", 'wb') do |f|
			f.write(file.read)
		end
		query = "UPDATE books SET bookname =
		 \'#{params['bookname']}\',description = \'#{params['description']}\', 
		 publisher = \'#{params['publisher']}\', author = \'#{params['author']}\',
		 price = \'#{params['price']}\',booktype= \'#{params['booktype']}\',
		 bookimage= \'#{path}\' WHERE id =\'#{params[:id]}\'"
		@update = connection.query(query)
		redirect'/book/manage'
		erb :manage
	end
	get '/book/delete/:id' do
		query = "DELETE FROM books WHERE id  = #{params['id']}"
		@delete = connection.query(query)
		redirect '/book/manage'
		erb :manage
	end
	
	post '/insert' do
		@filename = params[:file][:filename]
		file = params[:file][:tempfile]
		path = "images/products/#{@filename}"
		File.open("./public/#{path}", 'wb') do |f|
			f.write(file.read)
		end
		query = "INSERT INTO books (`bookname`, `description`, `publisher`, `author`, `price`, `booktype`, `bookimage`) 
		VALUES (\'#{params['bookname']}\', \'#{params['description']}\', \'#{params['publisher']}\', 
		\'#{params['author']}\', \'#{params['price']}\', \'#{params['booktype']}\', \'#{path}\')"

		@book = connection.query(query)
		redirect '/book/manage'
		erb :manage
	end
		  


end