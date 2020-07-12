class BookSearch < ApplicationRecord
     def self.search_books(book_by_title)
         client = Goodreads::Client.new(api_key: Rails.application.credentials.goodreads_client[:goodreads_api_key],
                                        api_secret: Rails.application.credentials.goodreads_client[:goodreads_api_secret_key])
         client.book_by_title(book_by_title)
     end
end