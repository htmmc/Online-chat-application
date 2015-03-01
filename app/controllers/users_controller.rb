class UsersController < ApplicationController

	before_filter :authenticate_user!

#	def index
#		if user_signed_in?
#			render 'index'
#		else redirect_to new_user_session_path
#		end 
#	end
	def chat_session
		render 'chat_session'
	end  

	def show
		@listener = User.find_by(id: params[:id])
	end 

	def edit
		unless current_user.id == params[:id].to_i
			render "errors"
		end 
	end

	def update
	    if current_user.update(cats_params)
	      flash[:notice] = "Updated successfully"
	      redirect_to user_path
	    else
	      flash[:error]  = "Oops! We couldn't update the information, please review the errors"
	      render('edit')
	    end
  	end
  	
	private 

	def not_permitted_to_edit_other_user
		unless params[:id].to_i == current_user.id
			render "errors"
		end
	end 
#	def send_confirmation_email
#		will set up later
#	end

end
