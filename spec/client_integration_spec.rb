require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do

	before { visit '/' }

	it 'should display navigation options' do
		expect(page).to have_content 'Clients'
	end

	it 'should allow the user to navigate to a list of all stylists' do
		click_link 'Clients'
		expect(page).to have_content 'Current Stylists:'
	end
end
