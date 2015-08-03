class UsersController < ApplicationController

	def show
		@username = current_user.name
	end
end
