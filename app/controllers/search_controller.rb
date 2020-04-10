class SearchController < ApplicationController

  def index
    @search_results = StationSearch.new(params[:location])
  end
end
