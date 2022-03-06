class Public::BooksController < ApplicationController

  # before_action :search

  # def search
  #   # params[:q]のqには検索フォームに入力した値が入る
  #   @q = Book.ransack(params[:q])
  # end

  def index
    # distinct: trueは重複したデータを除外
    if params[:keyword].present?
     @books = Book.search(params[:keyword])
    else
     @books = Book.all
    end
    # @books = @q.result(distinct: true)
  end

  # def search
  #   @books = Book.search(params[:keyword])
  #   @keyword = params[:keyword]
  #   render "index"
  # end

  # def index
  #   @books = Book.all
  # end

  def edit
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user_id
    @book.save!
    pp @book
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:image, :book_image, :title, :author)
  end

end
