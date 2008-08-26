class BogusFlagsController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  before_filter :login_required
  
  def create
    
    respond_to do |format|
      # very ugly, but prevents generation of custom controllers and views for each flag type. hopefully i'll think of more elegant way down the line
      @listing_id = params[:listing_id]
      @flag_type = 'bogus'
      
      if Listing.find(@listing_id).bogus_flags.create({:user_id => current_user.id})
        
        format.html { render :partial=>'shared/flag' }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
      else
        flash[:notice] = 'Add to favorites failed. Please try again.'
        format.js
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
end
