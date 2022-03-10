class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @book = Book.find(params[:book_id])
    # @book.user_id = Book.find(params[:user_id])
  end

  def index
    #@books = @books.where().page(params[:page])
     current_user_post = Post.where(user_id: current_user.id)
     book_ids = current_user_post.pluck('book_id').uniq
     @books = Book.where(id: book_ids)
  end

  def create
    # @book = Book.find(params[:id])
    # @book.user_id = current_user.id
    # @post.save!
    # pp @post
    # redirect_to posts_path
    @book = Book.find(params[:post][:id])
    @book_post = Post.new(post_params)
    @post = current_user.posts.new(post_params)
    @post.book_id = @book.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])  # データ（レコード）を1件取得
    @post.destroy  # データ（レコード）を削除
    redirect_to posts_path
  end

   private

  def post_params
    params.require(:post).permit(:reason)
  end

end
