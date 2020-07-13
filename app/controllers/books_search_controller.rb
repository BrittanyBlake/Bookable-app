class BooksSearchController < ApplicationController
    def search
        book_search = BookSearch.search_books(params[:book_search])
    end
end
