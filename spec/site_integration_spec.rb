require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do

	before { visit '/' }

	it 'should display navigation options' do
		expect(page).to have_content 'member'
		expect(page).to have_content 'stylists'
	end

	it 'should allow the user to navigate to a list of all stylists' do
		click_link('stylists')
		expect(page).to have_content 'Current Stylists:'
	end

	it 'should allow the user to navigate to a list of all clients' do
		click_link('clients')
		expect(page).to have_content 'Current Clients:'
	end
end

describe 'when creating a stylist', { type: :feature } do

	before { visit '/stylist/new' }

	it 'should render a form' do
		expect(page).to have_content 'Add a new stylist'
		expect(page).to have_content 'First name:'
		expect(page).to have_content 'Last name:'
		expect(page).to have_content 'Styles:'
	end

	it 'should create a new stylist when submitted and render the page of all stylists' do
		fill_in 'fname',  with: 'Joe'
		fill_in 'lname',  with: 'Pesci'
		fill_in 'styles', with: 'modern'
		click_button 'Add stylist'
		expect(page).to have_content 'Joe Pesci'
	end


end
