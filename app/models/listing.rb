class Listing < ActiveRecord::Base

#Constants
NON_MEMBER_LIMIT = 3



#Associations
has_many :favorites  
has_many :photos 
has_many :movies 
has_many :broker_flags 
has_many :na_flags 
has_many :bogus_flags 
has_many :comments 
has_many :contact_infos 
has_many :bedrooms

has_one :livingroom

belongs_to :user
belongs_to :nhood
  
has_many :listing_comments, :include=>:author

#Validations
validates_presence_of :rent,
    :address,
    :cross_street1,
    :cross_street2,
    :avail_date

validates_numericality_of :rent,
  
  #other
  :greater_than=>0, :only_integer=>true
      
validates_numericality_of :n_bedrooms,
  
  #other
  :only_integer=>true


#compound attributes
def add_apt_info(params)
  validates_presence_of :sq_footage,
        :ceiling_height,
        :multi_level,
        :penthouse,
        :private_entrance,
        :roaches,
        :rodents,
        :ants,
        :broadband,
        :doorman,
        :rent_stabilized,
        :rent_controlled,
        :convertable,
        :separate_kitchen,
        :balcony,
        :patio,
        :loft,
        :dogs_allowed,
        :cats_allowed

  validates_numericality_of :sq_footage,
        :ceiling_height,
        :greater_than=>0, :only_integer=>true
        
  update_attributes params

end

def add_building_info(params)
  validates_presence_of :roof_access,
        :elevator, 
        :gym, 
        :laundry, 
        :broadband, 
        :doorman

  
  update_attributes params
  
end

def has_photos?
  photos.size > 0
end

def rent_range
  (rent*0.9).round..(rent*1.1).round
end

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

#if param operator is '=', no need to include them in SQL_OPERATORS as that is the default. to exlude params for special handling use operatlor '#'. For 'IN' and 'BETWEEN' operator pass array of values
SQL_OPERATORS = {
  'rent' =>'BETWEEN',
  'avail_date'=>'>=',
  'n_bedrooms'=>'>=',
  'n_bathrooms'=>'>=',
  'sq_footage'=>'>=',
  'ceiling_height'=>'>=',
  'nhoods'=>'IN',
  'comment'=>'LIKE'}

SORT_ORDER = {
  'created_at' => 'listings.created_at DESC',
  'favorites_count' => 'listings.favorites_count DESC',
  'rent' => 'listings.rent ASC'}
    
def self.do_search(params, user, order_by='created_at', current_page=1, page_size=20)
    #expects params hash
    conditions = []
    
    #empty evertying else is ignored
    params.each do |key, val|
        Date.parse(params[key]).to_s(:db) if params[key].is_a?(Date) && !params["avail_date"].nil? && !params["avail_date"].blank?
        params [key] = "%#{val}%" if SQL_OPERATORS[key] == 'LIKE' && !val.blank?
        params [key] = "#{key} BETWEEN #{params[key][0]} AND #{params[key][1]}" if SQL_OPERATORS[key] == 'BETWEEN' && !val.blank?
        conditions << "#{key} #{SQL_OPERATORS[key]||'='} #{params[key].is_a?(Array) ? '(' + params[key] .join(',') + ')' : ':' + key}" unless SQL_OPERATORS[key]=='#'
    end unless params.blank? 
      
    # set up associations
    has_one :read_by_user, :class_name=>'Reading', :conditions=>"readings.user_id=#{user.id}"
    has_one :user_favorite, :class_name=>'Favorite', :conditions=>"favorites.user_id = #{user.id}"
    
    #check access rights
    unless user && user.has_basic_info_access?
      page_size = 3
      current_page = 0
    end
    
    self.find :all,
      :include => [
        :listing_comments,
        :photos, 
        :read_by_user,
        :user_favorite,
        :nhood],
      :conditions=>[conditions.join(' AND '), params],
      :page => {:size => page_size, :current => current_page},
      :order=>SORT_ORDER[order_by]

end



#attribute_values
#~ def nhood
  #~ AttributeLiterals::NHOODS[nhood]
#~ end

def pests_free=(value)
  roaches = rodents = ants = false if value > 0
end

def pests_free()
  ! (roaches || rodents || ants) if roaches || rodents || ants
end

def popularity()
  rand 6
end

def has_apt_info?
  ceiling_height ||
  floor_type ||
  heat_q ||
  ac_type ||
  private_back_yard ||
  street_noise_level ||
  nbors_noise_level ||
  appliances_q ||
  bathroom_q ||
  cellphone_q ||
  cellphone_provider
end
  
def has_bld_info?
  maintenance_q ||
  broker_only || 
  elevator || 
  multi_level || 
  penthouse || 
  private_entrance || 
  gym || 
  laundry || 
  roaches || 
  rodents || 
  ants || 
  broadband || 
  doorman || 
  rent_stabilized ||
  rent_controlled ||
  convertable ||
  separate_kitchen ||
  balcony ||
  patio ||
  loft ||
  roof_access ||
  public_back_yard ||
  dogs_allowed ||
  cats_allowed  
end

def has_photos?
  photos.size > 0
end


def has_room_info?
  rooms.size > 0
end

end
