require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do

	before { visit '/' }

	it 'should display navigation options' do
		expect(page).to have_content 'Clients'
	end

	it 'should allow the user to navigate to a list of all stylists' do
		click_link 'Clients'
		expect(page).to have_content 'Current Clients:'
	end
end

describe 'when creating a client', { type: :feature } do

	before { visit '/' }

	it 'should render a form and prompt to make a stylist if there are not any' do
		click_link 'Clients'
		expect(page).to have_content 'make a stylist first'
	end

	it 'should create a new client when the form is submitted and render the page of all
	    clients allowing the user to update and delete' do
		stylist = Stylist.new({ fname: 'fname', lname: 'lname', styles: 'styles', id: nil })
		stylist.save
		visit '/client/new'
		fill_in 'fname',      with: 'First'
		fill_in 'lname',      with: 'Last'
		fill_in 'address',    with: 'Address'
		fill_in 'hair_color', with: 'Hair'
		fill_in 'phone',      with: '1234567'
		select  from: 'stylist_id'
		click_button 'Add client'
		expect(page).to have_content 'First'
		click_link 'Update'
		fill_in 'fname', with: 'Second'
		click_button 'Submit edit'
		expect(page).to have_content 'Second'
		click_link 'View all clients'
		click_link 'Destroy'
		expect(page).to_not have_content 'Second'
	end
end
