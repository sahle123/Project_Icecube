class User < ActiveRecord::Base
	attr_accessible :user_name, :email, :password, :password_confirmation, :birth_date, :slogan, :mod, :reputation
	before_create :create_remember_token
	has_secure_password
	validates_presence_of :password,    :on => :create
  validates_presence_of :user_name,   :on => :create
  validates_presence_of :email,       :on => :create
  validates :user_name, :uniqueness => true
  validates :email,     :on => :create, :uniqueness => true


	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end

  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  def does_user_exist?(user)
    return true if User.where(:user_name => user).first != nil
  end

	private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
