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
		expect(page).to have_content('0 Stitches Created')
		visit '/'
		click_link 'Create Stitch'
		click_link 'or add a link to your stitch'
		fill_in("Link", with: 'https://www.youtube.com/watch?v=lmyZMtPVodo')
    fill_in("Tag", with: 'test')
    click_button 'Upload'
		visit '/users/1'
		expect(page).to have_content('1 Stitches Created') #test is failing because the stitch count is not updated when a video is added via a link
	end
	
	scenario 'Profile page shows number of stitches contributed to' do
		visit '/'
		click_link 'Profile'
		expect(page).to have_content('0 Stitch Contributions')
	end
	
	def sign_in
		visit '/'
		mock_auth_hash
		click_link 'Sign in with Google'
	end
	
	def add_video_link(link="https://www.youtube.com/watch?v=lmyZMtPVodo",tags="test")
    visit '/'
    mock_auth_hash
    click_link 'Sign in with Google'
    click_link 'or add a link to your stitch'
    fill_in("Link", with: link)
    fill_in("Tag", with: tags)
    click_button 'Upload'
    click_link 'Log Out'
  end

end

#RSpec.describe UsersController, type: :controller do

	

#end
