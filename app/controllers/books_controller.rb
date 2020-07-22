class BooksController < ApplicationController
  before_action :set_up_book,only:[:show,:edit,:update,:destroy]
  def index
    @books=Book.all
  end

  def show
  end

  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new(book_parameter)
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
  
  def set_up_book
    @book=Book.find(params[:id])
  end
end
