class BooksController < ApplicationController
	before_action :authorize
  
  def index
    @books = Book.all
  end

  def show
    @books = find_book
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params 
    @book.save 
    redirect_to books_url  
  end

  private

  def find_book
    Book.find(params[:id])
  end

  def book_params
    fields = [params[:book].permit(:title, :author, :published_at, :description, :rating)]
    params.require(:book).permit(fields)
  end

end
