class UsersController < ApplicationController

	before_filter :authenticate_user!

#	def index
#		if user_signed_in?
#			render 'index'
#		else redirect_to new_user_session_path
#		end 
#	end 
	def show
		redirect_to '/'

	end 
	def chat_session

	end 

end
