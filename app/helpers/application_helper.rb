module ApplicationHelper
	def show_nav_bar? 
		if params[:controller] == "users"
			return true if params[:action] == "index"
		elsif params[:controller] == "levels"
			return true if params[:action] == "new" or "index"
		end
			return false
	end
end
