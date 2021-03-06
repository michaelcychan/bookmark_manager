# ./app.rb

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'
require './lib/database_connection_setup'
require 'uri'
require 'sinatra/flash'
require './lib/comment'

class BookmarkManager < Sinatra::Base
    configure :development do
    register Sinatra::Reloader
  end
  
  register Sinatra::Flash
  enable :sessions, :method_override
  # method_override is to allow DELETE method

  # our routes would go here
  get '/' do
    flash[:notice] = "Hooray, Flash is working!"
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
    flash[:notice] = "Please enter a valid URL" unless Bookmarks.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  # :id is the id inside the html (inside the <li> tag)
  delete '/bookmarks/:id' do
    Bookmarks.delete(id: params[:id])
    redirect ('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :'comments/new'
  end

  post '/bookmarks/:id/comments/' do
    # connection = DatabaseConnection.setup('bookmark_manager_test')
    # connection.exec_params(
    #   "INSERT INTO comments (text, bookmark_id) VALUES($1, $2)",
    #  [params[:comment], params[:id]]
    # )
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmarks.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(url: params[:url], title: params[:title], id: params[:id])
    redirect('/bookmarks')
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
