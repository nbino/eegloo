class ListingsController < ApplicationController
  # GET /listings
  # GET /listings.xml
  
  
  #layout 'main'
  
  def index
    
    
    #Need to specify all nhoods as default
    @listings = Listing.do_search nil, current_user, 1, 20 
    @search_listing = Listing.new
    
    respond_to do |format|
      format.html { render :layout => 'main' }
      format.xml  { render :xml => @listings }
    end
  end

  def search
    #for all params 0 or blank value indicates ignore
    params[:listing].delete_if {|key, val| val.bank==""}
    
    #convert pests into roaches ants and mice
    #params[:listing][:roaches], params[:listing][:ants], params[:listing][:mice] = 0 unless params[:listing][:pests_free].nil?
    #params.delete :pest_free
        
    page = params[:custom_options][:page] || 1
    
    @listings = Listing.do_search params[:listing], current_user.id, params[:custom_options][:order_by], page
    @search_listing = Listing.new

    respond_to do |format|
      format.html { render :partial => '/shared/listing_list'}
      format.xml  { render :xml => @listings }
    end
    
  end

    
  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = Listing.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = current_user.listings.find_by_id(params[:id])
    load_basic_dropdown_values
    
    respond_to do |format|
      format.html { render :layout => "main" }
      format.xml  { render :xml => @listing }
    end
  end

  # POST /listings
  # POST /listings.xml
  def create
    
    respond_to do |format|
      format.html { render :patial => 'shared/listing_list'}
      format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
    end
      
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = current_user.listings.find_by_id(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        flash[:notice] = 'Thank you for updating the listing.'
        format.html { redirect_to :action => "edit" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

end
