class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
