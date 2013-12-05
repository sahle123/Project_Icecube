class SessionsController < ApplicationController
	def new
		render 'new'
	end

	def create
		user = User.find_by_user_name(params[:session][:user_name])
		if user && user.authenticate(params[:session][:password])
			flash.now[:notice] = 'Welcome Back!'
			# Session is used to temporary save the user state
			# To access if the user is signed in use User.find(session[:remember_token])
			session[:remember_token] = user.id
			render 'new'
      		#redirect_to level
		else
			flash.now[:notice] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end
end
