class User < ActiveRecord::Base
	attr_accessible :user_name, :email, :password, :password_confirmation, :birth_date, :slogan, :mod, :reputation
	has_secure_password
	validates_presence_of :password, :on => :create
end
