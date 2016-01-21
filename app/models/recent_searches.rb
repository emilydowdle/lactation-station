class RecentSearches
  def initialize(current_user)
    @current_user = current_user
  end

  def display
    if @current_user && @current_user.search_count_greater_than_6
      @current_user.recent_searches
    else
      Search.recent
    end
  end
end
