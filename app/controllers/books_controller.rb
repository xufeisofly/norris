class BooksController < ApplicationController

  def show
    @book = Book.find params[:id]
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to books_path
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    @book.update(book_params)

    redirect_to books_path
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :scan, :review, :overview)
  end
end
