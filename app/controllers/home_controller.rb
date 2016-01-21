class HomeController < ApplicationController
  def index
    @searches = RecentSearches.new(current_user).display
  end
end
