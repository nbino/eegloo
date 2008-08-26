class InviteController < ApplicationController
  layout 'main'
  #before_filter :login_required, :only => [:show, :edit, :update]

  def invite
    respond_to do |format|
      format.html { render :layout =>"main" }
      format.xml  { render :xml => @user }
    end
  end

  def get  
    
    require "contacts"
		login = params[:invite][:login]
		password = params[:invite][:password]
		
		@contacts = []
		begin
		  Contacts.new(params[:invite][:service], login, password).contacts.each { |c| 
  		  @contacts << Invite.new({:name => c[0] , :email => c[1]})
  		}
	  rescue
	    render :text => '<li>Login error.  Please try again.</li>'
	  else
	    render :partial => 'contact'	
    end
		
  end
  
  
end
