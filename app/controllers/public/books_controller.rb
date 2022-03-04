class Public::BooksController < ApplicationController
  def index
    @books = Book.all
  end

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
    @book.save
    redirect_to books_path
  end

  def search
    @books = Book.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def book_params
    params.require(:book).permit(:image, :book_image, :title, :author)
  end

end
