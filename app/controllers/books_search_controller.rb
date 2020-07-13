class BooksSearchController < ApplicationController
    def index
        client = Goodreads::Client.new(api_key:Rails.application.credentials.goodreads_client[:goodreads_api_key], api_secret: Rails.application.credentials.goodreads_client[:goodreads_api_secret_key])
    end

    def results
        client = Goodreads::Client.new(api_key:Rails.application.credentials.goodreads_client[:goodreads_api_key], api_secret: Rails.application.credentials.goodreads_client[:goodreads_api_secret_key])

        @search_raw = client.search_books(params[:search])

        if @search_raw.query == "" || @search_raw.results_end == "0"
      # Checking for edge cases.
        flash[:alert] = "Something went wrong"

        elsif @search_raw.results.first[1].count == 9
      # NOTE: the number of parameters per book is 9; therefore view page criterion is 9; CHECK for updates is data structure changes.
        @unique_result = @search_raw

        else
        @multi_results = @search_raw

        end

        render :_results
  end


    
end
