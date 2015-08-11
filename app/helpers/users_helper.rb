module UsersHelper
	def ids_of_users_following(user)
		followed_user_id_list = []
		for followed_user in user.follows
			followed_user_id_list << followed_user.user_id
		end #replace loop with an array method such as .select
		followed_user_id_list
		end
end
