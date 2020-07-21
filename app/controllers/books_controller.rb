class BooksController < ApplicationController
  before action :set_up_book,only:[:show,:edit,:update,:destroy]
  def index
    @books=Book.all
  end

  def show
  end

  def new
    @book=Book.new
  end
  
  def create
    
  end

  def edit
  end
  
  def updated
  end
  
  def destroy
  end
  
  private
  def book_parameter
    params.require(:book).permit(:title,:implession)
  end
  
  def set_up_book
    @book=Book.find(params[:id])
  end
end
