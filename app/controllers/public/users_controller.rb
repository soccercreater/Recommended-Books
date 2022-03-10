class Public::UsersController < ApplicationController
  def show
    @user = current_user
    # @book = Book.find(params[:id])
    # @post = Post.find(params:[:id])
    # @user.post_id = @post.where(post_id: @user.post_id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_path(current_user.id)
  end


  def  unsubscribe
  end

  def withdraw
  end

 private
  def user_params
   params.require(:user).permit(:name, :sex, :birthdate, :email, :age, :image)
  end
end