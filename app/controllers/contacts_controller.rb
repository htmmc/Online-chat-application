class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end 

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		#
		if @contact.deliver
			flash.now[:notice] ="Message successfuly sent."
		else 
			flash.now[:error] ="Message failed"
			render "new"
		end
	end 
end

