class FollowController < ApplicationController

	def create
		@follow = current_user.follows.build(:followed_user_id => params[:followed_user_id])
		if @follow.save
			flash[:notice] = "Followed"
			redirect_to root_url
		else
			flash[:notice] = "Unable to follow"
			redirect_to root_url
		end
	end
end
