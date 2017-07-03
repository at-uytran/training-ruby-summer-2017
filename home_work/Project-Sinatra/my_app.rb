require "mysql2"

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
		@results = client.query("SELECT * FROM book")
		erb :index
	end
	get '/book/manage' do
		@results = client.query("SELECT * FROM book")
		erb :manage
	end

	get '/book/manage/new' do
		erb :new
	end
	get '/book/shopcart' do
		erb :shopcart
	end
	get '/book/edit/:id' do
		@results = client.query("SELECT *  FROM book WHERE id = #{params[:id]}")
		erb :edit
	end
	post '/edit' do
		filename = params[:file][:filename]
		file = params[:file][:tempfile]
		path = "images/products/#{filename}"
		File.open("./public/#{path}", 'wb') do |f|
			f.write(file.read)
		end
		query = "UPDATE book SET bookname = '#{params[:bookname]}',description = '#{:description}', nxb = '#{params[:nxb]}', author = '#{params[:author]}',price = '#{:price}',booktype= '#{:booktype}' WHERE id ='#{params[:id]}'"
		@update = connection.query(query)
		redirect'/book/manage'
		erb :manage
	end
	get '/book/delete/:id' do
		query = "DELETE FROM book WHERE id  = #{params['id']}"
		@delete = connection.query(query)
		redirect '/book/manage'
		erb :manage
	end
	
	post '/insert' do
		filename = params[:file][:filename]
		file = params[:file][:tempfile]
		path = "images/products/#{@filename}"
		File.open("./public/#{path}", 'wb') do |f|
			f.write(file.read)
		end
		query = "INSERT INTO book (bookname,description,nxb,author,price,booktype,bookimage) VALUES (\'#{params['name']}\',\'#{params['description']}\',\'#{params['nxb']}\',\'#{params['author']}\',\'#{params['price']}\',\'#{params['booktype']}\',\'#{filename}\')"
		@book = connection.query(query)
		redirect '/bookstore'
		erb :manage
	end
end