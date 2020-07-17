class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update]
  def index
    @user = current_user
    @books = Book.where(user: current_user).includes([:groups]).ordered_by_most_recent
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = 'Book was successfully added'
      redirect_to @book
    else
      flash.now[:alert] = 'something went wrong. Please double-check that you have filled in all the required fields'
      render 'new'
    end
  end

  def external
    @books = Book.where(user: User.where.not(id: current_user.id)).includes([:groups]).ordered_by_most_recent
  end

  def show; end

  def edit; end

  def update
    @book.update(book_params)
    if @book.save
      flash[:notice] = "#{@book.title} successfully edited"
      redirect_to @book
    else
      render 'edit'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :number_of_pages, :image, :description, group_ids: [])
  end
end
