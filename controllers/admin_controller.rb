require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/artist')
require_relative('../models/exhibition')


get '/admin/artist' do
  @artists = Artist.find_all()
  erb :"artists_admin/index" , :layout => :admin_layout
end

get '/admin/exhibition' do
  @exhibitions = Exhibition.find_all()
  erb :"exhibitions_admin/index" , :layout => :admin_layout
end

## Remember to create a folder with artist views and exhibitions views
## Also, visitor will have a different layout look in comparison to admin

get '/admin/artist/new' do
  erb :"artists_admin/new" , :layout => :admin_layout
end

post '/admin/artist' do
  @artist = Artist.new(params)
  @artist.save()
  redirect '/admin/artist'
end

get '/admin/exhibition/new' do
  @artists = Artist.find_all
  erb :"exhibitions_admin/new" , :layout => :admin_layout
end

get '/admin/artist/:id' do
  @artist = Artist.find_id(params['id'])
  erb :"artists_admin/show" , :layout => :admin_layout
end

get '/admin/exhibition/:id' do
  @exhibition = Exhibition.find_id(params['id'])
  erb :"exhibitions_admin/show" , :layout => :admin_layout
end

post '/admin/exhibition' do
  @exhibition = Exhibition.new(params)
  @exhibition.save()
  redirect '/admin/exhibition'
end

get '/admin/artist/:id/edit' do
  @artist = Artist.find_id(params['id'])
  erb :"artists_admin/edit" , :layout => :admin_layout
end

post '/admin/artist/:id' do
  @artist = Artist.new(params)
  @artist.update()
  redirect '/admin/artist'
end

post '/admin/artist/:id/delete' do
  @artist = Artist.find_id(params[:id])
  @artist.delete()
  redirect '/admin/artist'
end

get '/admin/exhibition/:id' do
  @exhibition = Exhibition.find_id(params['id'])
  erb :"exhibitions_admin/show" , :layout => :admin_layout
end

get '/admin/exhibition/:id/edit' do
  @artists = Artist.find_all()
  @exhibition  = Exhibition.find_id(params['id'])
  erb :"exhibitions_admin/edit" , :layout => :admin_layout
end

post '/admin/exhibition/:id' do
  @exhibition = Exhibition.new(params)
  @exhibition.update()
  redirect '/admin/exhibition'
end

post '/admin/exhibition/:id/delete' do
  @exhibition = Exhibition.find_id(params[:id])
  @exhibition.delete
  redirect '/admin/exhibition'
end
