##
# Class responsible for handling all activities related to search
class SearchesController < ApplicationController
  def index
    if params[:search_text].present?
      text_query=params[:search_text]
      date_query=params[:tweet_date]
      @data_query=params[:tweet_data]
      if date_query.present? 
        query=text_query+" "+"since:"+date_query
      else
        query=text_query
      end
      @tweets = $twitter.search(query).first(10)
      @tweets = $twitter.search(query).to_a
      retweets = Array.new
      @tweets.each do |tweet|
        retweets << tweet if tweet.retweeted_status.present?
      end
      if @data_query == "Retweeted"
        if retweets.count>=1
          @tweets = retweets 
        end
      end
      @searches = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)  
    end
  end

  
end
