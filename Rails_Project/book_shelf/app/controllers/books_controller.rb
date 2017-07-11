class BooksController < ApplicationController
	
	layout 'application'

	def index
		@books = Book.all

	# binding.pry
	end
	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		if @book.save
			redirect_to books_path
		else
			render 'new'
		end
	end
	def destroy
	    Book.find(params[:id]).destroy
	    flash[:success] = "Book deleted"
	    redirect_to books_path
	    		# binding.pry
	end
	def update

		@book = Book.find(params[:id])
		if @book.update_attributes(book_params)
			# binding.pry
	      	redirect_to @book
		# Handle a successful update.
		else
      		render 'edit'
		end
	end

	def edit
	    @book = Book.find(params[:id])
	end

	def show
	    @book = Book.find(params[:id])

		# @books = Book.find(params[:id] )
		# @books.destroy
	end

	def book_params
		params.require(:book).permit(:name, :author,:publisher,:description,:price,:image)
	end
end
