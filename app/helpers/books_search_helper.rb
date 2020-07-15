module BooksSearchHelper
  def search_results
    if @multi_results
      render 'multi'
    else
      render 'unique'
    end
  end
end
