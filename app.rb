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
