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

	def == (another_stylist)
		self.fname  == another_stylist.fname  &&
		self.lname  == another_stylist.lname  &&
		self.styles == another_stylist.styles &&
		self.id     == another_stylist.id
	end

	def delete
		DB.exec("DELETE FROM stylists WHERE id = #{self.id}")
	end

	def update (attributes)
		@fname 			 = attributes[:fname]
		@lname 			 = attributes[:lname]
		@styles 		 = attributes[:styles]
		DB.exec("UPDATE stylists
			       SET fname = '#{@fname}', lname = '#{@lname}', styles = '#{@styles}'
			       WHERE id = #{@id};")
	end

	def self.find (other_stylist_id)
		found_stylist = nil
		Stylist.all.each do |stylist|
			if stylist.id == other_stylist_id
				found_stylist = stylist
			end
		end
		found_stylist
	end

	def self.all
		returned_stylists = DB.exec("SELECT * FROM stylists;")
		stylists          = []
		returned_stylists.each do |stylist|
			@fname 			= stylist['fname']
			@lname 			= stylist['lname']
			@styles			= stylist['styles']
			@id 				= stylist['id'].to_i
			stylists.push Stylist.new({ fname: @fname, lname: @lname, styles: @styles, id: @id })
		end
		stylists
	end
end
