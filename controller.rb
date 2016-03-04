require('sinatra')
require('sinatra/contrib/all') if development?
require('json')
require('pg')
require_relative('./models/bookmark.rb')


get '/bookmarker' do
  erb(:home)
end

get'/bookmarker/new' do
  erb(:new)
end

