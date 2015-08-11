class FollowController < ApplicationController

	def create
		@follow = current_user.follows.build(:followed_user_id => params[:followed_user_id])
		if @follow.save
			flash[:notice] = "Followed"
			redirect_to user_path(params[:followed_user_id])
		else
			flash[:notice] = "Unable to follow"
			redirect_to user_path(params[:followed_user_id])
		end
	end
	
	def destroy
		@follow = current_user.follows.find_by(user_id: params[:id])
		@follow.destroy
		flash[:notice] = "Unfollowed"
		redirect_to user_path(params[:id])
	end
end
