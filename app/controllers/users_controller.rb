class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])

    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])

    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
