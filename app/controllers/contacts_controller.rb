class ContactsController < ApplicationController
	
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    
    respond_to do |format|
			if @contact.deliver
				format.html { redirect_to action: 'index', notice: 'Thank you. We will be in contact shortly'}
				format.js { render action: 'create' }
			else
				format.html { render action: 'new' }
				format.js
			end
	end
  end
end
