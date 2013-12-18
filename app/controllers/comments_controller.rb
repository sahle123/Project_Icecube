class CommentsController < ApplicationController
	def new
		@comment = Comment.new

	    	respond_to do |format|
	    	format.html # new.html.erb
	    	format.json { render json: @level }
    	end
	end

	def create
	end

	def destroy
	end
end
