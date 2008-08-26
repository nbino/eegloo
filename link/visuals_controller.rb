class VisualsController < ApplicationController
  # GET /visuals
  # GET /visuals.xml
  before_filter :find_listing
  
  def index
    @visuals = Listing.find(params[:listing_id]).photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visuals }
    end
  end

  # GET /visuals/1
  # GET /visuals/1.xml
  def show
    @visual = Visual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visual }
    end
  end

  # GET /visuals/new
  # GET /visuals/new.xml
  def new
    @photo = Photo.new
    
    @photos = Listing.find(params[:listing_id]).photos
    
    respond_to do |format|
      format.html { render :layout => "main" }
      format.xml  { render :xml => @visual }
    end
  end

  # GET /visuals/1/edit
  def edit
    @visual = Visual.find(params[:id])
  end

  # POST /visuals
  # POST /visuals.xml
  def create
    @photo = Photo.new(params[:visual])
    
    respond_to do |format|
      if @listing.photos << @photo
        @visuals = Listing.find(params[:listing_id]).photos
        format.html { render :action => 'index' }
        format.xml  { render :xml => @visual, :status => :created, :location => @visual }
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visual.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  # PUT /visuals/1
  # PUT /visuals/1.xml
  def update
    @visual = Visual.find(params[:id])

    respond_to do |format|
      if @visual.update_attributes(params[:visual])
        flash[:notice] = 'Visual was successfully updated.'
        format.html { redirect_to(@visual) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visual.errors, :status => :unprocessable_entity }
      end
    end
  
  end

  # DELETE /visuals/1
  # DELETE /visuals/1.xml
  def destroy
    @visual = Visual.find(params[:id])
    @visual.destroy

    respond_to do |format|
      format.html { redirect_to(visuals_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_listing
    redirect_to new_user_url unless params[:listing_id]
    @listing = Listing.find(params[:listing_id])
  end
  
end
