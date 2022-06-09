# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override
  # method_override is to allow DELETE method
  
  # our routes would go here
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :'bookmarks/index'
  end

  get '/bookmarks-new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks-new' do
    Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    puts params
    Bookmarks.delete(id: params[:id])
    redirect ('/bookmarks')
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
