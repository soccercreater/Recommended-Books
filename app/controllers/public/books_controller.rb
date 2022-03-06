class Public::BooksController < ApplicationController

  def index
    if params[:keyword].present?
     @books = Book.search(params[:keyword])
    else
     @books = Book.page(params[:page])
    end
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
    @book_assessment = Assessment.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save!
    pp @book
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:image, :book_image, :title, :body, :author)
  end

end
