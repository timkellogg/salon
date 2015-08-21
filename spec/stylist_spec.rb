require 'spec_helper'

describe Stylist do 

	before { @stylist = Stylist.new({ fname: 'Sara', lname: 'Adams', styles: 'modern', id: nil }) }

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
			expect(@stylist.styles).to eq 'modern'
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
		it 'should consider as equal two stylists whose attributes are equal' do 
			another_stylist = Stylist.new({ fname: 'Sara', lname: 'Adams', styles: 'modern', id: nil })
			expect(@stylist).to eq another_stylist
		end
	end

	describe '#delete' do 
		it 'should destory the stylist record' do 
			@stylist.save 
			@stylist.delete 
			expect(Stylist.all).to eq []
		end
	end

	describe '.find' do  
		it 'should return a stylist by it\'s id' do 
			@stylist.save 
			expect(Stylist.find(@stylist.id)).to eq @stylist 
		end
	end

	describe '#update' do 
		it 'should update multiple attributes of the stylist without changing others' do  
			@stylist.save 
			@stylist.update({ fname: 'Bruce', lname: 'Wayne', styles: 'modern'})
			expect(@stylist.fname).to eq 'Bruce'
			expect(@stylist.styles).to eq 'modern'
		end
	end
end











