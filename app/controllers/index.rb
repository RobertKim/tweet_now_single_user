get '/' do
  erb :index
end

get '/:username' do
  query_twitter
  erb :index
end

get '/:username/refresh' do
  query_twitter
  erb :_tweets, :layout => false
end


get '/:username/tweetnow' do
  query_twitter_user
  erb :tweet_now
end


post '/send_tweet' do 
  Twitter.update(params[:tweet_text])
  query_twitter
  erb :_tweets, layout: false
  # redirect "/#{@user}"
end


