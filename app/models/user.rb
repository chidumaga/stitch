class User < ActiveRecord::Base

  class << self
    def from_omniauth(auth)
      user = User.find_or_initialize_by(uid: auth['uid'])
      user.name = auth['info']['name']
      user.token = auth['credentials']['token']
      user.save!
      user
    end
  end
  
	has_many :tags
	has_many :videos
	has_many :follows
	has_many :followed_users, :through => :follows
end
