require './config/environment'

class TweetsController < ApplicationController
  configure do
    set :views, 'app/views'
  end

end
