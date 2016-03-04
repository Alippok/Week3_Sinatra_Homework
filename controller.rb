require('sinatra')
require('sinatra/contrib/all') if development?
require('json')
require('pg')
require_relative('./models/bookmark.rb')


get '/bookmarker' do
  erb(:home)
end

#NEW
get'/bookmarker/new' do
  erb(:new)
end

#CREATE
post '/bookmarker' do
  @bookmark = Bookmark.new(params)
  @bookmark.save()
  redirect to ('/bookmarker')
end

#VIEW
get '/bookmarker/all' do
  @bookmarks = Bookmark.all
  erb(:index)
end


#SHOW


#EDIT




#UPDATE


#DESTROY