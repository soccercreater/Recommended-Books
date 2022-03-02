class Admin::UsersController < ApplicationController
  def index
    @user = User.all
    @users = User.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :sex, :age, :birthdate, :email, :profile_image, :is_active, :boolean)
  end

end
