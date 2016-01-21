class Tweeter
  def self.update(params)
    tweet = params[:tweet]
    current_user.tweet(tweet)
  end
end
