class SessionsController < ApplicationController
	def new
		render 'new'
	end

	def create
		user = User.find_by_user_name(params[:session][:user_name])
		if user && user.authenticate(params[:session][:password])
			flash.now[:notice] = 'Welcome Back!'
			sign_in user
      		redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to home_path
	end
end
