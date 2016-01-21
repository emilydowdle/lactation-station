class StatusController < ApplicationController
  def create
    # weird that tweet isn't using the Twitter::Tweet.new <- Twitter Service object
    tweet = params[:tweet]
    current_user.tweet(tweet)
    redirect_to profile_path
  end
end
