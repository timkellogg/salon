require 'spec_helper'

describe Stylist do 

	before { @stylist = Stylist.new({ fname: 'Sara', lname: 'Adams', style: 'modern', id: nil }) }

	describe '#fname' do 
		it 'should return the first name of the stylist' do  
			expect(@stylist.fname).to eq 'Sara'
		end
	end
end