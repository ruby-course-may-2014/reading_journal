class BooksController < ApplicationController
	before_action :authorize
  
  def index
    @books = Book.all
  end

  def show
    @book = find_book
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.save 
    flash[:notice] = "#{@book.title} was successfully created."
    redirect_to books_url  
  end

  def edit
    @book = find_book
  end

  def update
    @book = find_book
    @book.update_attributes!(book_params)
    @book.save
    flash[:notice] = "#{@book.title} was successfully updated."
    redirect_to @book
  end
 
  def destroy
    @book = find_book
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
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
