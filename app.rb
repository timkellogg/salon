require 'sinatra'
require 'sinatra/reloader'
require './lib/client.rb'
require './lib/stylist.rb'
require 'pg'
require 'pry'

DB = PG.connect({ dbname: 'hair_salon' })

get '/' do
	erb :index
end

# clients -- new
get '/client/new' do
	@stylists = Stylist.all
	erb :client_create_form
end

# stylists -- new
get '/stylist/new' do
	@stylists = Stylist.all
	erb :stylist_create_form
end


# stylists -- index
get '/stylists' do
	@stylists = Stylist.all
	erb :stylists
end

# clients -- index
get '/clients' do
  @clients = Client.all
	@stylists = Stylist.all
	erb :clients
end

# clients -- show
get '/client/:id' do
	id      = params['id'].to_i
	@client = Client.find id
	erb :client
end

# stylists -- show
get '/stylist/:id' do
	id       = params['id'].to_i
	@stylist = Stylist.find id
	erb :stylist
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

# stylists -- edit
get '/stylist/:id/edit' do
	id        = params['id'].to_i
	@stylist  = Stylist.find id
	@fname    = @stylist.fname
	@lname    = @stylist.lname
	@styles   = @stylist.styles
	erb :stylist_edit_form
end

# clients -- edit
get '/client/:id/edit' do
	@stylists   = Stylist.all
	id          = params['id'].to_i
	@client     = Client.find id
	@fname      = @client.fname
	@lname      = @client.lname
	@address    = @client.address
	@hair_color = @client.hair_color
	@phone 		  = @client.phone
	@stylist_id = @client.stylist_id.to_i
	erb :client_edit_form
end

# clients -- update
patch '/client/:id' do
	id         = params['id'].to_i
	@client    = Client.find id
	fname      = params['fname']
	lname      = params['lname']
	address    = params['address']
	hair_color = params['hair_color']
	phone      = params['phone']
	stylist_id = params['stylist_id'].to_i
	@client.update({ fname: fname, lname: lname, address: address, hair_color: hair_color,
		               phone: phone, stylist_id: stylist_id })
	erb :client
end

patch '/stylist/:id' do
	id         = params['id'].to_i
	@stylist   = Stylist.find id
	fname      = params['fname']
	lname      = params['lname']
	styles     = params['styles']
	@stylist.update({ fname: fname, lname: lname, styles: styles })
	erb :stylist
end

# stylists -- destroy
get '/stylists/:id' do
	id = params['id'].to_i
	stylist = Stylist.find id
	stylist.delete
	redirect '/stylists'
end

# clients -- destroy
get '/clients/:id' do
	id      = params['id'].to_i
	client  = Client.find id
	client.delete
	redirect '/clients'
end
