require 'spec_helper'

describe Client do 

	before do 
		@client = Client.new({ fname: 'Big', lname: 'McLargeHuge', address: '123 Secondary Street', 
			                     hair_color: 'brown', phone: '1234567', stylist_id: 1, id: nil })
	end

	describe '#fname' do 
		it 'should return the first name of the client' do 
			expect(@client.fname).to eq 'Big'
		end
	end
end