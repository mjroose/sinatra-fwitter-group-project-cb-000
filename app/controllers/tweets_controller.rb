require './config/environment'

class TweetsController < ApplicationController
  configure do
    set :views, 'app/views'
    enable :sessions
  end

  get '/tweets' do
    binding.pry
    if User.logged_in?(session)
      @user = User.current_user(session)
      @tweets = Tweet.all

      erb :'/tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if User.logged_in?(session)
      erb :'/tweets/new'
    else
      redirect to '/login'
    end
  end

  get '/tweets/:id' do
    if User.logged_in?(session)
      @tweet = Tweet.find_by(id: params[:id])
      erb :'/tweets/show_tweet'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if User.logged_in?(session)
      user = User.current_user(session)
      tweet = Tweet.new(content: params[:content])
      tweet.user = user
      tweet.save
      binding.pry
      redirect to "/tweets/#{tweet.id}"
    else
      redirect to 'login'
    end
  end
end
