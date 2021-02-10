class BooksController < ApplicationController
  def index
    
  end

  def show
    @book = Book.find (params[:id])
  end
  
  def new
    @book = Book.new
    @books = Book.all
  end
  def create
    
    book = Book.new(book_params)
     if book.save
     flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
     end
  end

  def edit
    @book = Book.find (params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  
  def destroy

    book = Book.find(params[:id])
    book.destroy
      flash[:notice]  = "Book was successfully destroyed."
    redirect_to new_book_path
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
