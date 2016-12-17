##
# Class responsible for handling all activities related to dashboard
class DashBoardController < ApplicationController
  def index
    data=params[:tweet_text]
    if data!=nil
      DashBoard.tweet_name data
    end
    
    #intialise tweet variables
    @user_array=Array.new
    @retweet_count=0
    @tweet_count=0
    @retweet_count_array=Array.new
    @user_array_count=0
  #Twitter search key-word
  if params[:tweet_text].present?
    @tweets = $twitter.search(params[:tweet_text]).first(5)  
    @tweets.each do |tweet|
       p "================="
      p  tweet.to_json
       p "================="
    end

   
    # @tweets = $twitter.search(params[:tweet_text]).to_a
    if @tweets.present?
      @tweets.each do |tweet|
        p tweet.id
        p tweet.retweet_count
        @user_array<<tweet.user.id
        @retweet_count=@retweet_count+tweet.retweet_count
      end
    end
    @tweet_count=@tweets.count
    @user_array_count=@user_array.uniq.count
  end

end
end











