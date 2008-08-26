class NaFlagsController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  before_filter :login_required
  
  #there must be a way to DRY this, but haven't figured it out yet
  def create
    
    Na_flag.create(:user_id => current_user, :listing_id => params[:listing_id] )
    
    respond_to do |format|
        format.html { render :partial=>'shared/thank_you' }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
    end
  end
end
