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
  
  has_many :stitches 
  has_many :contributions
	has_many :tags
end
