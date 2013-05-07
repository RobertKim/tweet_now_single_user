class User < ActiveRecord::Base
  has_many :tweets
  validates :username, :uniqueness => true


  def stale_tweets?(user)
    Twitter.user_timeline(user.username)[9].text != user.tweets.last.text
  end

  def get_tweets(user)
    if user.tweets.empty? || stale_tweets?(user)
      Tweet.delete("user_id = #{user.id}") if user.tweets
      Twitter.user_timeline(user.username)[0..9].map { |tweet| Tweet.find_or_create_by_text_and_user_id(:text => tweet.text, :user_id => user.id)} 
    else
      user.tweets.reverse
    end
  end



end
