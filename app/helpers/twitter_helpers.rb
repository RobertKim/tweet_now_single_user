helpers do
  def query_twitter
    @twitter_user = Twitter.user(params[:username])
    @user = User.find_or_create_by_username(:name => @twitter_user.name, :username => @twitter_user.username)
    @tweets = @user.get_tweets(@user)
  end

  def query_twitter_user
    @twitter_user = Twitter.user(params[:username])
    @user = User.find_or_create_by_username(:name => @twitter_user.name, :username => @twitter_user.username)
  end


end
