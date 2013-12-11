require 'spec_helper'
require 'user'

describe User do
	before :each do
		@user = User.new(user_name: 'Bill', email: 'Bill@Bill.Bill', password: 'password', password_confirmation: 'password')
	end
	describe "#new" do
		it "returns a new user" do
			@user.should be_an_instance_of User
		end

	end
end