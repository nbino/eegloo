class ListingInfosController < ApplicationController
  # GET /listing_infos
  # GET /listing_infos.xml
  before_filter :find_listing
  layout 'main'

  # GET /listing_infos/1
  # GET /listing_infos/1.xml
  def show
  end
  
  
  
  # GET /listing_infos/new
  # GET /listing_infos/new.xml
  def new
    
    unless @listing.listing_info.nil?
      redirect_to :action => 'edit'
      return
    end
    
    init_select_values
    
    @listing_info = ListingInfo.new
    @listing_info.livingroom = Livingroom.new
    @listing.apt_type.bedrooms.times {@listing_info.bedrooms.build}
  
    respond_to do |format|
      format.html 
      #format.xml  { render :xml => @listing_info }
    end
 end

  # GET /listing_infos/1/edit
  def edit
    unless @listing_info = @listing.listing_info
      redirect_to :action => 'new'
      return
    end
    
    init_select_values
    respond_to do |format|
      format.html 
      #format.xml  { render :xml => @listing_info }
    end
  end
  
  # POST /listing_infos
  # POST /listing_infos.xml
  def create
    @listing_info = @listing.build_listing_info params[:listing_info]
    
    respond_to do |format|
      if @listing_info.save
        flash[:notice] = 'ListingInfo was successfully created.'
        format.html { redirect_to :action=>'edit'}
        format.xml  { render :xml => @listing_info, :status => :created, :location => @listing_info }
      else
        format.html { render :action => "new", :layout => "main" }
        format.xml  { render :xml => @listing_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listing_infos/1
  # PUT /listing_infos/1.xml
  def update
    @listing_info = @listing.listing_info
    @listing_info.attributes = params[:listing_info]

    respond_to do |format|
      #need to call save explicitly for associations
      if @listing_info.valid? && @listing_info.livingroom.valid? && @listing_info.bedrooms.all?(&:valid?) 
        @listing_info.save!
        @listing_info.livingroom.save!
        @listing_info.bedrooms.each(&:save!)
        flash[:notice] = 'ListingInfo was successfully updated.'
        format.html { redirect_to(:action=>'edit') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_infos/1
  # DELETE /listing_infos/1.xml
  def destroy
  end

  def find_listing
    @listing = current_user.listing
  end
  
  
  def init_select_values
    @apt_types = AptType.find :all
    @nhoods = Nhood.find :all
    @ac_types = AcType.find :all
    @cellphone_select = CellphoneQ.find :all
    @maintenance_select = MaintenanceQ.find :all
    @heat_select = HeatQ.find :all
    @bathroom_select = BathroomQ.find :all
    @appliances_select = AppliancesQ.find :all
    @cellphone_select = CellphoneQ.find :all
    @nbors_noise_levels = NborsNoiseLevel.find :all
    @street_noise_levels = StreetNoiseLevel.find :all
    @back_yard_types = BackYardType.find :all
    @roof_access_types = RoofAccessType.find :all
    @floor_types = FloorType.find :all
    @ac_types = AcType.find :all
    @light_levels = LightLevel.find :all
    @window_directions = WindowDirection.find :all
    @cellphone_providers = CellphoneProvider.find :all
    #there must be an easier way
    temp_arr = []
    Struct.new('BathroomNumChoice', :id, :name)
    (0..ListingInfo::MAX_BATHROOMS).each {|i| temp_arr[i] = Struct::BathroomNumChoice.new(i, "#{i==0 ? 'Shared' : i }")}
    @no_of_bathrooms_select = temp_arr
    
  end
  

end
