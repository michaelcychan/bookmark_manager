# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'

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
    @bookmarks = ["http://www.makersacademy.com",
      "http://www.destroyallsoftware.com",
      "http://www.google.com"
    ]
    
    erb :bookmarks
  end


  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
