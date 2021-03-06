class Public::BooksController < ApplicationController

  def index
    if params[:keyword].present?
     @books = Book.search(params[:keyword])
    else
     @books = Book.page(params[:page])
    end
     @books = @books.page(params[:page])
  end

  def edit
     @book = Book.find(params[:id])
     @book_assessments = Assessment.where(book_id: @book.id)
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end



  def show
    @book = Book.find(params[:id])
   # @book_assessment = Assessment.where(params[:id]
    @book_assessments = Assessment.where(book_id: @book.id)

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      pp @book
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:image, :book_image, :title, :body, :author, :comment)
  end

end
