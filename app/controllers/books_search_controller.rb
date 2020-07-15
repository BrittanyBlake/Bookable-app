class BooksSearchController < ApplicationController
  before_action :set_client, only: %i[index results]

  def index
   
  end

  def results
    @search_raw = @client.search_books(search_params)

    if @search_raw.query == '' || @search_raw.results_end == '0'
      flash[:alert] = 'Something went wrong'
    elsif @search_raw.results.first[1].count == 9
      @unique_result = @search_raw
    else
      @multi_results = @search_raw
    end
    render :_results
  end

  private

  def set_client
    @client = Goodreads::Client.new(api_key: ENV['GOODREADS_API_KEY'], api_secret: ENV['GOODREADS_API_SECRET_KEY'])
  end 

  def search_params
    params[:search]
  end
end
