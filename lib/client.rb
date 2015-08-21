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
	def self.find (other_client_id)
		found_client = nil 
		Client.all.each do |client|
			if client.id == other_client_id
				found_client = client 
			end 
		end
		found_client
	end

	# all 
	def self.all
		returned_clients = DB.exec("SELECT * FROM clients;") 
		clients 				 = []
		returned_clients.each do |client|
			fname 			= client['fname']
			lname 			= client['lname']
			address 		= client['address']
			hair_color  = client['hair_color']
			phone 			= client['phone']
			stylist_id  = client['stylist_id'].to_i 
			id 				  = client['id'].to_i 
			clients.push Client.new({ fname: fname, lname: lname, address: address, hair_color: hair_color, phone: phone, stylist_id: stylist_id, id: id })
		end
		clients 
	end

	# save 
	def save 
		result = DB.exec("INSERT INTO clients (fname, lname, address, hair_color, phone, stylist_id) 
			                VALUES ('#{@fname}', '#{@lname}', '#{@address}', '#{@hair_color}', '#{@phone}', #{@stylist_id}) 
			                RETURNING id;")
		@id    = result.first['id'].to_i
	end

	def == (other_client)
	   self.fname      == other_client.fname      &&
		 self.lname      == other_client.lname      && 
		 self.address    == other_client.address    &&
		 self.hair_color == other_client.hair_color && 
		 self.phone      == other_client.phone      && 
		 self.stylist_id == other_client.stylist_id &&
		 self.id         == other_client.id 
	end

	# delete s
	def delete 
	end

	# update 
	def update
	end
end