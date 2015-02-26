class UsersController < ApplicationController
	def index
		if user_signed_in?
			render 'index'
		else redirect_to new_user_session_path
		end 
	end 
	def chat_session
		# once listner is created, check if listner is available
		
	end 

end
