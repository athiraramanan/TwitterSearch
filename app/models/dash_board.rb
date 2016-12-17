class DashBoard < ActiveRecord::Base

	def self.tweet_name query	
	  @tweets = $twitter.search(query).first(5)
	end
	
end





