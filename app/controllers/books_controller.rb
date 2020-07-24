class BooksController < ApplicationController
  before_action :set_book,only:[:edit,:update,:destroy]
  skip_before_action :login_required,only:[:index]
  def index
    @books=Book.all.order(created_at: :desc)
  end
  
  def mine
    @books=current_user.books.order(created_at: :desc)
    @user=current_user
  end

  def show
    @book=Book.find(params[:id])
    @user=current_user
  end

  def new
    @book=Book.new
  end
  
  def create
    @book=current_user.books.new(book_parameter)
    if @book.save
      redirect_to books_path,notice:"ツイートしました"
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
      render :new,notice:"ツイートを編集"
    end
  end
  
  def destroy
    @book.destroy
    redirect_to @book,notice:"ツイートを削除"
  end
  
  private
  def book_parameter
    params.require(:book).permit(:title,:implession)
  end
  
  def set_book
    @book=current_user.books.find(params[:id])
  end

end
