class Client 

	attr_reader :fname, :lname, :address, :hair_color, :phone, :stylist_id, :id 

	def initialize (attributes)
		@fname 			= attributes[:fname]
		@lname 			= attributes[:lname]
		@address 		= attributes[:address]
		@hair_color = attributes[:hair_color]
		@phone 			= attributes[:phone]
		@stylist_id = attributes[:stylist_id]
		@id 				= attributes[:id]
	end

	# find 
	def self.find (other_client)
	end

	# all 
	def self.all
		returned_clients = DB.exec("SELECT * FROM clients;") 
		clients 				 = []
		returned_clients.each do |client|
			fname 			= client['fname']
			lname 			= client['lname']
			address 		= client['address']
			hair_color = client['hair_color']
			phone 			= client['phone']
			stylist_id = client['stylist_id'].to_i 
			id 				= client['id'].to_i 
			clients.push Client.new({ fname: fname, lname: lname, address: address, hair_color: hair_color, phone: phone, stylist_id: stylist_id, id: id })
		end
		clients 
	end

	# save 
	def save 
	end

	# delete 
	def delete 
	end

	# update 
	def update
	end
end