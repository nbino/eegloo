class FriendsController < ApplicationController
  # GET /listings
  # GET /listings.xml
  
  before_filter :login_required
  layout 'main'
  #layout 'main'
  
  def index
    
    @listings =current_user.favorite_listings.with_options
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end
  
  
end
