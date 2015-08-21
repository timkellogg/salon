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

	describe '#save' do 
		it 'should store the client into the database' do  
			@client.save 
			expect(Client.all).to eq [@client]
		end
	end

	describe '#==' do  
		it 'should consider equal two clients whose attributes other than ids are the same' do  
			client = Client.new({ fname: 'Big', lname: 'McLargeHuge', address: '123 Secondary Street', 
			                      hair_color: 'brown', phone: '1234567', stylist_id: 1, id: nil })
			expect(@client).to eq client 
		end
	end

	describe '.find' do  
		it 'should return the client by it\'s id' do 
			@client.save 
			expect(Client.find(@client.id)).to eq @client 
		end
	end

	describe '#delete' do  
		it 'should remove the client from the database' do  
			@client.save 
			@client.delete 
			expect(Client.all).to eq []
		end
	end

	describe '#update' do  
		it 'should update multiple attributes of the client without changing others' do  
			@client.save 
			@client.update({ fname: 'Small', lname: 'McTinyMicroscopic', address: '123 Secondary Street', 
			                 hair_color: 'orange', phone: '7654321', stylist_id: 1, id: nil })
			expect(@client.fname).to eq 'Small'
			expect(@client.lname).to eq 'McTinyMicroscopic'
			expect(@client.stylist_id).to eq 1
		end
	end
end
























