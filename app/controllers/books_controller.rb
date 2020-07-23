class BooksController < ApplicationController
  before_action :set_book,only:[:edit,:update,:destroy]
  def index
    @books=Book.all
  end
  
  def mine
  
  end

  def show
    @book=Book.find(params[:id])
  end

  def new
    @book=Book.new
  end
  
  def create
    @book=current_user.books.new(book_parameter)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @book.update(book_parameter)
      redirect_to @book
    else
      render :new
    end
  end
  
  def destroy
    @book.destroy
    redirect_to @book
  end
  
  private
  def book_parameter
    params.require(:book).permit(:title,:implession)
  end
  
  def set_book
    @book=current_user.books.find(params[:id])
  end

end
