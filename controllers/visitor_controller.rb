require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/artist')
require_relative('../models/exhibition')


get '/artist' do
  @artists = Artist.find_all()
  erb(:"artist/index")
end

get '/exhibition' do
  @artists = Artist.find_all
  @exhibitions = Exhibition.find_all()
  erb(:"exhibition/index")
end


post '/exhibition/filter_by_artist' do
  artist = Artist.find_id(params['artist_id'])
  @exhibition = artist.exhibitions
  erb(:"exhibition/filter_by_artist")
end

post '/exhibition/filter_by_category' do
  @exhibition = Exhibition.find_by_category(params['category'])
  erb(:"exhibition/filter_by_category")
end

get '/exhibition/:id' do
  @exhibition = Exhibition.find_id(params['id'])
  erb(:"exhibition/show")
end

get '/artist/:id' do
  @artist = Artist.find_id(params['id'])
  erb(:"artist/show")
end
