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

	describe '#lname' do  
		it 'should return the last name of the client' do  
			expect(@client.lname).to eq 'McLargeHuge'
		end
	end

	describe '#address' do  
		it 'should return the address of the client' do  
			expect(@client.address).to eq '123 Secondary Street'
		end
	end

	describe '#hair_color' do  
		it 'should return the hair color of the client' do  
			expect(@client.hair_color).to eq 'brown'
		end
	end

	describe '#phone' do  
		it 'should return the phone number of the client' do  
			expect(@client.phone).to eq '1234567'
		end
	end

	describe '#stylist_id' do  
		it 'should return the stylist id of which the client belongs to' do 
			expect(@client.stylist_id).to eq 1
		end
	end

	describe '#id' do  
		it 'should return the id of the client which should be nil at first' do  
			expect(@client.id).to eq nil
		end
	end

	describe '.all' do 
		it 'should be empty at first' do  
			expect(Client.all).to eq []
		end
	end

end