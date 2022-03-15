class Admin::BooksController < ApplicationController

  def index
    if params[:keyword].present?
     @books = Book.search(params[:keyword])
    else
     @books = Book.page(params[:page])
    end
     @books = @books.page(params[:page])
  end

  def new
     @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save!
    pp @book
    redirect_to admin_books_path
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
    @book_assessments = Assessment.where(book_id: @book.id)
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to admin_books_path
  end

   private

  def book_params
    params.require(:book).permit(:image, :book_image, :title, :body, :author, :comment)
  end
end
