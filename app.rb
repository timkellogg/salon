require 'sinatra'
require 'sinatra/reloader'
require './lib/client.rb'
require './lib/stylist.rb'
require 'pg'

DB = PG.connect({ dbname: 'hair_salon' })

get '/'  do
	erb(:index)
end

# stylists -- index
get '/stylists' do
	@stylists = Stylist.all
	erb :stylists
end

# clients -- index
get '/clients' do
  @clients = Client.all
	erb :clients
end

# stylists -- new
get '/stylist/new' do
	erb :stylist_create_form
end

# clients -- new
get '/client/new' do
	@stylists = Stylist.all
	erb :client_create_form
end

# stylists -- create
post '/stylists' do
	fname   = params['fname']
	lname   = params['lname']
	styles  = params['styles']
	stylist = Stylist.new({ fname: fname, lname: lname, styles: styles, id: nil })
	stylist.save
	redirect '/stylists'
end

# clients -- create
post '/clients' do
	fname      = params['fname']
	lname      = params['lname']
	address    = params['address']
	hair_color = params['hair_color']
	phone 		 = params['phone']
	stylist_id = params['stylist_id'].to_i
	client     = Client.new({ fname: fname, lname: lname, address: address,
		            hair_color: hair_color, phone: phone, stylist_id: stylist_id})
	client.save
	redirect '/clients'
end
