class UsersController < ApplicationController

	before_filter :authenticate_user!

#	def index
#		if user_signed_in?
#			render 'index'
#		else redirect_to new_user_session_path
#		end 
#	end
	def chat_session_listener
		#redirect to a chatting page
	end
	def chat_session_user
		#redirect to a chatting page
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

  	def feedback_user
# add criteria later
  	end

	private 

	def not_permitted_to_edit_other_user
		unless params[:id].to_i == current_user.id
			render "errors"
		end
	end 
	def user_params
		params.require(:user).permit(:username, :license_type, :religion, :language, :agegroup, :description, :specialty, :categories)
	end 
#	def send_confirmation_email
#		will set up later
#	end

end
