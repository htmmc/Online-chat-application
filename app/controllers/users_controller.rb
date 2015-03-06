class UsersController < ApplicationController

	before_filter :authenticate_user!

#	def index
#		if user_signed_in?
#			render 'index'
#		else redirect_to new_user_session_path
#		end 
#	end
	def chat_session
		#/user/chat_session/4
		#/user/chat_session
		#redirect to a chatting page for user to connect to listener
		#originally used this line to determine the path request.path == "/users/chat_session"
		if !current_user.ready
			puts 'NOT READY'
			redirect_to users_path
		elsif current_user.listener == true && params[:id].to_i != current_user.id 
			puts 'NOT ME'
			redirect_to chat_session_path(current_user)
		elsif current_user.listener == false 
			@listener = User.where(listener: true).order("RANDOM()").first
		end
	end 

	def show
		@user = User.find_by(id: params[:id])
	end 

	def edit
		unless current_user.id == params[:id].to_i
			render "errors"
		end 
	end

	def update
	    if current_user.update_attributes user_params
	      flash[:notice] = "Updated successfully"
	      redirect_to user_path
	    else
	      @errors = current_user.errors.full_messages
	      flash[:error]  = "Oops! We couldn't update the information, please review the errors"
	      render 'edit'
	    end
  	end  

  	def ready
  		if current_user.listener == true
  			current_user.update(:ready => true)
  			redirect_to chat_session_path(current_user)
  		else 
  			current_user.update(:ready => true)
  			redirect_to chat_session_path(current_user)
  		end 

  	end 

  	def busy 
  		if current_user.listener == true
  			current_user.update(:ready => false)
  			redirect_to user_path(current_user)
  		else 
  			current_user.update(:ready => false)
  			redirect_to listener_search_path
  		end 
  	end 

  	def feedback
  		
  	end 
  	def report_abuse
  		
  	end 
 

	private 

	def not_permitted_to_edit_other_user
		unless params[:id].to_i == current_user.id
			render "errors"
		end
	end 
	def user_params
		params.require(:user).permit(:username, :license_type, :religion, :language, :agegroup, :description, :specialty, :categories, :listener, :ready)
	end 
#	def send_confirmation_email
#		will set up later
#	end

end
