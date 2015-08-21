require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do

	before { visit '/' }

	it 'should display navigation options' do
		expect(page).to have_content 'member'
	end

	it 'should allow the user to navigate to a list of all clients' do
		click_link('clients')
		expect(page).to have_content 'Current Clients:'
	end
end

describe 'when creating a client', { type: :feature } do

	before { visit '/client/new' }

	it 'should render a form' do
		expect(page).to have_content 'Add a new client'
		expect(page).to have_content 'First name:'
		expect(page).to have_content 'Last name:'
		expect(page).to have_content 'Address:'
    expect(page).to have_content 'Hair Color:'
    expect(page).to have_content 'Phone:'
    expect(page).to have_content 'Select a Stylist:'
	end

	it 'should create a new client when submitted and render the page of all clients' do
		fill_in 'fname',      with: 'Donald'
		fill_in 'lname',      with: 'Trump'
		fill_in 'address',    with: 'Times Square'
    fill_in 'hair_color', with: 'strange'
    fill_in 'phone',      with: '555-5555'
    select 'Pesci',       from: 'stylist_id'
		click_button 'Add client'
		expect(page).to have_content 'Donald Trump'
	end
end