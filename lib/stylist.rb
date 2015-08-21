class Stylist

	attr_reader :fname, :lname, :styles, :id 

	def initialize (attributes) 
		@fname 			= attributes[:fname]
		@lname 			= attributes[:lname]
		@styles			= attributes[:styles]
		@id 				= attributes[:id]
	end

	def save 
		result = DB.exec("INSERT INTO stylists (fname, lname, styles) 
			                VALUES ('#{self.fname}', '#{self.lname}', '#{self.styles}') 
			                RETURNING id;")
		@id    = result.first['id'].to_i 
	end

	def delete 
	end

	def update 
	end

	def find 
	end

	def all
	end
end