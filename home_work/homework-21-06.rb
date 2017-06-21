require 'mysql2'

def database_test
	@host_name = "localhost"
	@user_name = "root"
	@password = "avicii"
	@database  ="book_shelf"
	client = Mysql2::Client.new(:host => @host_name, :username => @user_name,:password=>@password, :database =>@database)
	results = client.query("SELECT * FROM users")
	p results.first
	results.each do |row |
		p row["name"].to_s
	end
	book_name = client.query("SELECT * FROM book")
	book_name.each do |row|
		p row["bookname"].to_s
	end

	# p row["id"]
	# while client.next_result
	# 	result = client.store_result
	# 	p result.first
	# end
end
database_test