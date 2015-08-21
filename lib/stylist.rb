class Stylist

	attr_reader :fname, :lname, :style, :id 

	def initialize (attributes) 
		@fname 			= attributes[:fname]
		@lname 			= attributes[:lname]
		@style			= attributes[:style]
		@id 				= attributes[:id]
	end
end