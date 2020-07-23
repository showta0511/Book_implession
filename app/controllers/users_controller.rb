class UsersController < ApplicationController
  skip_before_action :login_required,only:[:new,:create]
  before_action :user_set,only:[:index,:show,:edit,:update,:destroy]
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to user_url(@user),notice:"ユーザー名「#{@user.name}さん」のプロフィールを登録しました。"
    else
      render :new,notice:"失敗しました。"
    end
  end

  def edit
  end
  
  def update
    if @user.save
      redirect_to @user,notice:"ユーザー名「#{@user.name}さん」のプロフィールをを更新しました。"
    else
      render :edit
    end    
  end

  def show
  end

  def index
  end
  
  def destroy
    
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
  
  def user_set
    @user=User.find(params[:id])
  end
end
