class BooksController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @my_books = @user.books
    end

    def new
        @book = Book.new
    end

    def create
        @book = current_user.books.build(book_params)
        if @book.save
            flash[:notice] = 'Book was successfully added'
            redirect to @book
        else
            flash.now[:alert] = 'something went wrong'
            render 'new'
        end    
    end

    private
    def book_params
        params.require(:book).permit(:title, :author, :number_of_pages)
    end
end
