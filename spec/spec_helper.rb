require 'pg'
require 'rspec'
require './app'
require 'client'
require 'stylist'
require 'capybara/rspec'
require 'launchy'

DB = PG.connect({ dbname: 'hair_salon_test' })

RSpec.configure do |config|
	config.after :each do
		DB.exec("DELETE FROM clients *;")
		DB.exec("DELETE FROM stylists *;")
	end
end
