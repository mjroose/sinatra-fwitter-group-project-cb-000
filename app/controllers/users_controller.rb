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
    # user = User.create(username: params[:username], email: params[:email], password: params[:password])
    binding.pry

    # if user
    #   redirect to "/users/#{user.slug}"
    # else
    #   @error_message = "Invalid user info.  Please provide a username, email, and password."
    #   erb :'/users/create_user'
    # end
  end
end
