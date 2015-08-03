require 'rails_helper'

feature 'User profile page' do

	before(:each) do
		sign_in
	end

	scenario 'Profile page shows users name' do
		visit '/'
		click_link 'Profile'
		expect(page).to have_content("mockuser")
	end
	
	scenario 'Profile page shows number of stitches created' do
		visit '/'
		click_link 'Profile'
		expect(page).to have_content(' 0 stitches created')
	end
	
	def sign_in
		visit '/'
		mock_auth_hash
		click_link 'Sign in with Google'
	end

end

#RSpec.describe UsersController, type: :controller do

	

#end
