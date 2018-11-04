require './config/environment'

class TweetsController < ApplicationController
  configure do
    set :views, 'app/views'
  end

  get '/tweets' do
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

  post '/tweets' do
    if User.logged_in?(session)
      user = User.current_user(session)
      binding.pry
    else
      redirect to 'login'
    end
  end
end
