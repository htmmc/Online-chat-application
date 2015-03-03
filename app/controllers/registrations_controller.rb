class RegistrationsController < Devise::RegistrationsController  
  private
 
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :term_agreement, :birthday)
  end

  def after_sign_up_path_for(resource)
    "/users/#{params[:id]}"
  end 
end
