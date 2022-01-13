require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload './lib/bookmarks'
  end

  get '/' do
    "Welcome to Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/new' do
    Bookmark.create(url: params['url'],title: params['title'])
    redirect '/bookmarks'
  end

  run if app_file == $0

end