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

# stylist -- new
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
	erb :stylist
end
