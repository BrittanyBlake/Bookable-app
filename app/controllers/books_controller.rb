class BooksController < ApplicationController
    def index
        @user = current_user
        @books = Book.where(user: current_user).ordered_by_most_recent
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

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
         if @book.save
            flash[:notice] = "#{@book.title} successfully edited"
            redirect_to @book
        else
            render 'edit'
        end
    end

    def destroy
        @book.destroy
        redirect_to @book
    end


    private
    def book_params
        params.require(:book).permit(:title, :author, :number_of_pages, :image, group_ids:[])
    end
end
