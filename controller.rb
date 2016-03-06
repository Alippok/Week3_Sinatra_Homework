require('sinatra')
require('sinatra/contrib/all') if development?
require('json')
require('pg')
require_relative('./models/bookmark.rb')


get '/' do
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

#INDEX
get '/bookmarker' do
  @bookmarks = Bookmark.all
  erb(:index)
end


#SHOW
get '/bookmarker/:id' do 
  @bookmark = Bookmark.find(params["id"])
  erb(:show)
end


#EDIT
get '/bookmarker/:id/edit' do
  @bookmark = Bookmark.find(params["id"])
  erb(:edit)
end


#UPDATE
post '/bookmarker/:id' do
  Bookmark.update( params )
  erb(:home)
end

#DESTROY
post '/bookmarker/:id/delete' do
  Bookmark.delete(params["id"])
  redirect to ('/')
end