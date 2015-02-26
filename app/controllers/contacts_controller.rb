class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end 

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		#
		if @contact.deliver
			flash.now[:notice] ="Thank you for your message! We will get back to you soon!"
		else 
			flash.now[:error] ="Your email did not go through."
			render "new"
		end
	end 
end

