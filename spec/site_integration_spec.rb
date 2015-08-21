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

	before { visit '/stylists' }

	it 'should render a form' do
		expect(page).to have_content 'Current Stylists'
	end

	
end
