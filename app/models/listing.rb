class Listing < ActiveRecord::Base
  
  NON_MEMBER_LIMIT = 3
  
  has_many :favorites
  has_many :photos
  has_many :movies
  has_many :broker_flags
  has_many :na_flags
  has_many :bogus_flags
  has_many :listing_comments
  has_many :contact_infos, :bedrooms
  has_one :living_room
  
  belongs_to :user
    
  has_many :listing_comments, :include=>:author

  validates_presence_of(
      :apt_type_id,
      :rent_range_top,
      :rent_range_bottom,
      :nhood_id,
      :address, :cross_street,
      :avail_date)

  validates_numericality_of(
    :apt_type_id,
    :rent_range_top,
    :rent_range_bottom,
    :nhood_id,
    
    #other
    :greater_than=>0, :only_integer=>true)
        
  validates_associated(
    :apt_type,
    :nhood
    )

  #is read by current user?
  def read?
    !(read_by_user.nil?)
  rescue NameError
    raise 'do_search must first be performed'
  end
  
  #is current user favorite?
  def favorite?
    !(user_favorite.nil?)
  rescue NameError
    raise 'do_search must first be performed'
  end
  
  #is not read by current_user?
  def unread?
    !read?
  end
  
  def visuals?
    !(visuals.size == 0)
  end
  
  
  def flag_alert?
    broker_alert? || na_alert? || bogus_alert?
  end
  
  def broker_alert?
    broker_flag_count == 5
  end
  
  def na_alert?
    na_flag_count == 5
  end
  
  def bogus_alert?
    bogus_flag_count == 5
  end
  
  def image_alert?
    image_flag_count == 5
  end
  
  def apt_info_alert?
    bogus_flag_count == 5
  end
  
  def building_info_alert?
    bogus_flag_count == 5
  end
  
  def contact_alert?
    bogus_flag_count == 5
  end
  
  #if param operator is '=', no need to include them in SQL_OPERATORS as that is the default. to exlude params for special handling use operatlor '#'
  SQL_OPERATORS = 
  {
    'avail_date'=>'<=',
    'ac_type_id'=>'>=',
    'bathroom_n_id'=>'>=',
    'no_of_balconies'=>'>=',
    'no_of_bathrooms'=>'>=',
    'sq_footage'=>'>=',
    'ceiling_height'=>'>=',
    'rent_range_top'=>'<=',
    'rent_range_bottom'=>'>=',
    'nhoods'=>'#',
    'comment'=>'LIKE'}
  
  SORT_ORDER =
  {
    'created_at' => 'listings.created_at DESC',
    'favorites_count' => 'listings.favorites_count DESC',
    'rent_range_bottom' => 'listings.rent_range_bottom ASC'
  }
      
  def self.do_search(params, user_id, order_by='created_at', current_page=1)
       #expects params hash
       
      conditions = []
      
      #process params
      
      #emty nhoods are not ignored. 
      if  params.nil? || params.empty? || params['nhoods'].nil? || params['nhoods'].empty?
        conditions << 'nhood_id = 0' 
      else
        #add parans for IN operator and join array. "all" is a special value that means all
        conditions << "nhood_id IN (#{params['nhoods'].join(',')})" unless params['nhoods'].include? 'all'
      end
        
      
      #empty evertying else is ignored
      unless params.nil? || params.empty?
        
        params["avail_date"] = Date.parse(params["avail_date"]).to_s(:db) unless params["avail_date"].nil?
        
        params.each {|key,val| params [key] = "%#{val}%" if val != '' && SQL_OPERATORS[key] == 'LIKE'}
        
        #now join params with operators. exclude IN
        params.each {|key, val| conditions << "#{key} #{SQL_OPERATORS[key]||'='} :#{key}" unless SQL_OPERATORS[key]=='#'}
          
      end
        
      # set up associations
      has_one :read_by_user, :class_name=>'Reading', :conditions=>"readings.user_id=#{user_id}"
      has_one :user_favorite, :class_name=>'Favorite', :conditions=>"favorites.user_id = #{user_id}"
      
      self.find(
        :all,
        :include => [
          :listing_info, 
      #   :listing_comments,
      #   :photos, 
          :read_by_user,
          :current_favorite
          ],
        :conditions=>[conditions.join(' AND '), params],
        :page => {:size => 20, :current => current_page},
        :order=>SORT_ORDER[order_by])
        

 end
  
  
end
