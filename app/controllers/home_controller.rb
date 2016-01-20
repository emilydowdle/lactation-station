class HomeController < ApplicationController

  def index
    if current_user && current_user.search_count_greater_than_6
      @searches = current_user.recent_searches
    else
      @searches = Search.recent
    end
  end
end
