module TweetsHelper
  def tot_likes(tweet)
    tweet.likes.count
  end
end
