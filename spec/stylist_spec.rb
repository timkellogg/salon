require 'spec_helper'

describe Stylist do 

	before { @stylist = Stylist.new({ fname: 'Sara', lname: 'Adams', styles: ['modern'], id: nil }) }

	describe '#fname' do 
		it 'should return the first name of the stylist' do  
			expect(@stylist.fname).to eq 'Sara'
		end
	end

	describe '#lname' do 
		it 'should return the last name of the stylist' do 
			expect(@stylist.lname).to eq 'Adams'
		end
	end

	describe '#style' do  
		it 'should return the hair style options of the stylist' do 
			expect(@stylist.styles).to eq ['modern']
		end
	end

	describe '#id' do  
		it 'should return the id of the stylist' do 
			expect(@stylist.id).to eq nil 
		end
	end

	describe '#save' do 
		it 'should store the stylist in the database' do 
			@stylist.save 
			expect(Stylist.all).to eq [@stylist]
		end
	end

	describe '#==' do 
		
	end
end