module ApplicationHelper
	# this helper function determines when to show the navagation bar 
	# in application.html.erb. 
	def show_nav_bar? 
		if params[:controller] == "users"
			return true if params[:action] == "index"
		elsif params[:controller] == "levels"
			return true if params[:action] == "new" or "index"
		end
		return false
	end

	def show_signup_and_login?
		if params[:controller] == "users"
			return false if params[:action] == "new"
		end
		return true
	end
end
