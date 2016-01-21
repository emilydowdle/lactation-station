class Tweeter
  def self.update(params, current_user)
    tweet = params[:tweet]
    current_user.tweet(tweet)
  end
end
