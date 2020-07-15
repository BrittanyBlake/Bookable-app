module BooksHelper
    def book_user
        render 'opinion' if @book.user == current_user
    end

    def book_edit
        render 'bookedit' if @book.user == current_user
    end
end
