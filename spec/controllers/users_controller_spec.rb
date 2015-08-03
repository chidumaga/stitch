require 'rails_helper'

feature 'User profile page' do

	before(:each) do
		sign_in
	end

	scenario 'Profile page shows users name' do
		visit '/users/1'
		expect(page).to have_content("mockuser")
	end
	
	def sign_in
		visit '/'
		mock_auth_hash
		click_link 'Sign in with Google'
	end

end

#RSpec.describe UsersController, type: :controller do

	

#end
