require './config/environment'

class UsersController < ApplicationController
  configure do
    set :views, 'app/views'
    enable :sessions
  end

  get '/signup' do
    @error_message = session[:error_message]
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id
      binding.pry
      redirect to "/tweets"
    else
      @error_message = "Invalid user info.  Please provide a unique username, email, and password."
      erb :'/users/create_user'
    end
  end

  post '/login' do
    begin
      user = User.find_by(username: params[:username], email: params[:email], password: params[:password])
    rescue
      user = nil
    end

    if user
      session[:user_id] = user.id
      redirect to "/tweets"
    else
      @error_message = "Invalid user info.  Please provide a unique username, email, and password."
      erb :'/users/login'
    end
  end

end
