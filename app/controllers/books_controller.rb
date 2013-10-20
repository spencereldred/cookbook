class BooksController < ApplicationController
  # allows access to the books/index and books/show
  before_filter :authorize, except: [:index, :show]

  def index
    flash[:errors] = []
    @books = Book.all
  end

  def new
    flash[:errors] = []
    @book = Book.new
  end

  def create
    book = Book.create(params[:book])
    if book.errors.empty?
      redirect_to book_path(book)
    else
      flash[:errors] = book.errors.full_messages
      @book = Book.new
      render :new
    end
  end

  def edit
    flash[:errors] = []
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update_attributes(params[:book])
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
    @recipes = Recipe.find_all_by_book_id(params[:id])
    puts "$$$$$$$$$ @recipes = #{@recipes.inspect}"
  end

  def destroy
    Book.delete(params[:id])
    redirect_to books_path
  end

end
