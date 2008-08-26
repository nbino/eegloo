class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  layout 'main'
  
  #NOTE make sure all destructive queries are parameterized by user id
  
  def index
    
    @listings =current_user.favorite_listings.with_options
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end
  
  def search
    
    page = (params[:custom_options] && params[:custom_options][:page]) || 1
    note_substring = (params[:favorite] && params[:favorite][:note]) || ''
    order_by = params[:order_by] || 'created_at'
    @listings =current_user.favorite_listings.with_options note_substring, page, order_by
    
    respond_to do |format|
      format.html {render :partial => 'shared/listing_list'}
      format.xml  { render :xml => @listings }
    end
  
  end

  # GET /favorites/1
  # GET /favorites/1.xml
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorite }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.xml
  def new
    @favorite = Favorite.new
    
    respond_to do |format|
      format.html # new.html.erb
    end
      format.xml  { render :xml => @favorite }
  end

  # POST /favorites
  # POST /favorites.xml
  def create
    
    @favorite = Listing.find(params[listing_id]).favorites.create(:user_id=>current_user)
    
    respond_to do |format|
      #need to call create on a listing to increment counter
      #for security purposes make sure that the user is current_user
      
      if 
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
      else
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # POST /favorites
  # POST /favorites.xml
  def update
    current_user.favorites.update(params[:favorite_id],:note=>params[:favorites][:note])
    
    respond_to do |format|
      #need to call create on a listing to increment counter
        format.html { render :partial=>'show_note', :locals=>{:favorite=>@favorite} }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
    end
  end
    
  
  # DELETE /favorites/1
  # DELETE /favorites/1.xml
  def destroy
    #need to delete on a listing to decrement counter. Need to doublecheck if counter is decremeted
    Listing.find(params[listing_id]).favorites.delete_all(:user_id=>current_user)
    #Listing.decrement_counter( :favorites_count, current_user.favorite_listings.find(parms[listing_id])

    respond_to do |format|
      format.xml  { head :ok }
    end
  end
  
  private
  
end
