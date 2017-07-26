# :nodoc:
class BooksController < ApplicationController
  layout 'application'

  def items
    @page = params[:page].to_i
    @page = 1 if @page.zero?
    @allpage = Book.all.count / 12
    @books = Book.all.limit(12).offset((@page - 1) * 12)
  end

  def search
    # @books = Book.joins(:orders).author_search(params[:search_value])
    authorname = params[:search_value]
    @book = Book.all.joins(:orders).where('books.author like
    :authorname', authorname: authorname)
  end

  def index
    @page = params[:page].to_i
    @page = 1 if @page.zero?
    @allpage = Book.all.count / 10
    # binding.pry
    @books = Book.all.limit(10).offset((@page - 1) * 10)
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
    params.require(:book).permit(:name, :author, :title, :isn)
  end
end
