require './config/environment'

class UsersController < ApplicationController
  configure do
    set :views, 'app/views'
    enable :sessions
  end

  get '/signup' do
    erb :'/users/create_user'
  end

  get '/login' do
    erb :'/users/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  post '/users' do
    if User.already_exists?(params)
      @error_message = "User already exists.  Click <a href='/login'>here</a> to log in."
      erb :'/users/create_user'
    else
      user = User.new(username: params[:username], email: params[:email], password: params[:password])
    end
    
    if user.save
      session[:user_id] = user.id
      redirect to "/users/#{user.slug}"
    else
      @error_message = "Invalid user info.  Please provide a username, email, and password."
      erb :'/users/create_user'
    end
  end
end
