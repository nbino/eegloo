class ReadingsController < ApplicationController
  # GET /ReadListings
  # GET /ReadListings.xml
  before_filter :login_required 
  layout 'main'
  
  #all destructive actions should be on current user


  # POST /ReadListings
  # POST /ReadListings.xml
  def create
    
    current_user.readings.create(:listing_id => params[:listing_id])
    respond_to do |format|
      #need to call create on a listing to increment counter
      format.xml  { head :ok }
    end
    
  end

  # DELETE /ReadListings/1
  # DELETE /ReadListings/1.xml
  def destroy
    
    # need to delete on current user for security
    current_user.readings.delete_all(:listing_id=>params[:listing_id])
    
    respond_to do |format|
      format.xml  { head :ok }
    end
  end
  
  private
  
end
