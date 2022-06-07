# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  # our routes would go here
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end


  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
