class User < ActiveRecord::Base
	attr_accessible :user_name, :email, :password, :password_confirmation, :birth_date, :slogan, :mod, :reputation
	before_create :create_remember_token
	has_secure_password
	validates_presence_of :password, :on => :create

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
