class TweetsController < ApplicationController
  before_action :authenticate_user!
  # GET /tweets or /tweets.json
  def index
    @tweet = Tweet.new
    timeline_tweets
  end

  # tweet /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'tweet was successfully created.'
    else
      timeline_tweets
      render :index, alert: 'tweet was not created.'
    end
  end

  private

  def timeline_tweets
    @timeline_tweets ||= Tweet.all.ordered_by_most_recent.includes(:user)
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
