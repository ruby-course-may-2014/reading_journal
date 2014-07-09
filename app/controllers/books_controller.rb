class BooksController < ApplicationController
	before_action :authorize,
                :find_book, except: [:index, :new, :create]
  
  def index
    @books = current_user.books
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build book_params
    if @book.save 
      flash[:notice] = "#{@book.title} was successfully created."
      redirect_to books_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @book.update_attributes!(book_params)
    @book.save
    flash[:notice] = "#{@book.title} was successfully updated."
    redirect_to @book
  end
 
  def destroy
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_url
  end

  private

  def find_book
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :published_at, :description, :rating)
  end

end
