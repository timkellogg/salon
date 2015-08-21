require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do
	it 'should display navigation options' do
		visit '/'
		expect(page).to have_content 'member'
		expect(page).to have_content 'stylists'
	end

	it 'should display a list of all current stylists' do
		visit '/'
		click_link('stylists')
		expect(page).to have_content 'Current Stylists:'
	end
end
