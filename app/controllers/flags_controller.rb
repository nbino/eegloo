class FlagsController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  before_filter :login_required
  
  def create
    #overriding single table inheritance to DRY this up
    Flag.create(:user_id => current_user, :listing_id => params[:listing_id], :type=>params[:flag][:type])
    
    respond_to do |format|
        format.html { render :partial=>'shared/thank_you' }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
    end
  end
end
