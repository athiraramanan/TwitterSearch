class DashBoardController < ApplicationController
  def index
   if params[:tweet_text].present?
   	  @tweets = $twitter.search(params[:tweet_text]).first(5)
   	  p  $twitter.search(params[:tweet_text])
      # @tweets = $twitter.search(params[:tweet_text]).to_a
   end
  end
end
