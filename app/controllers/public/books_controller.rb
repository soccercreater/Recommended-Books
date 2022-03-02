class Public::BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def edit
  end

  def show
  end

  def new
  end

  def search
    @books = Book.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
end
