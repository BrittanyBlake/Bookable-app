class BooksController < ApplicationController
    def index
        @user = User.find(current_user.id)
        @my_books = Book.where(user: current_user).ordered_by_most_recent
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
            flash.now[:alert] = 'something went wrong'
            render 'new'
        end    
    end

    def external
        @books = Book.where(user: (User.where.not(id: current_user.id))).ordered_by_most_recent
    end


    private
    def book_params
        params.require(:book).permit(:title, :author, :number_of_pages, :image)
    end
end
