require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do

	before { visit '/' }

	it 'should display navigation options' do
		expect(page).to have_content 'Stylists'
	end

	it 'should allow the user to navigate to a list of all stylists' do
		click_link 'Stylists'
		expect(page).to have_content 'Current Stylists:'
	end
end

describe 'when creating a stylist', { type: :feature } do

	before { visit '/' }

	it 'should render a form' do
		click_link 'Stylists'
		expect(page).to have_content 'Add a new stylist'
		expect(page).to have_content 'First Name:'
		expect(page).to have_content 'Last Name:'
		expect(page).to have_content 'Styles:'
	end

	it 'should create a new stylist when submitted and render the page of all stylists allowing
	    the user to update and delete' do
		visit '/stylist/new'
		fill_in 'fname',  with: 'Joe'
		fill_in 'lname',  with: 'Pesci'
		fill_in 'styles', with: 'modern'
		click_button 'Add stylist'
		expect(page).to have_content 'Joe Pesci'
		click_link 'Update'
		fill_in 'fname',  with: 'John'
		click_button 'Submit edit'
		expect(page).to have_content 'John'
		save_and_open_page
		expect(page).to have_content 'John'
		click_link 'View all stylists'
		click_link 'Destroy'
		expect(page).to_not have_content 'John'
	end
end
