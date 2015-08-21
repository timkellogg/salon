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
end