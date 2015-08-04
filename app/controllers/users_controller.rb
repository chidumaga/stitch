class UsersController < ApplicationController

	def show
		@username = current_user.name
		@stitch_count = current_user.stitches.count
		@contribution_count = current_user.contributions.count
	end
end
