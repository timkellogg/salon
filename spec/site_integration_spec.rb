require 'spec_helper'

Capybara.app = Sinatra::Application

describe 'when navigating to the home page', { type: :feature } do 
	it 'should display navigation options' do 
		visit '/'
	end
end