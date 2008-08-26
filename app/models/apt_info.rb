class AptInfo < ActiveRecord::Base
  has_many :bedrooms
  has_one :livingroom
  belongs_to :listing 
  belongs_to :floor_type
  belongs_to :heat_q
  belongs_to :ac_type
  belongs_to :street_noise_level
  belongs_to :nbors_noise_level
  belongs_to :maintenance_q
  belongs_to :appliances_q
  belongs_to :bathroom_q
  belongs_to :cellphone_q
  belongs_to :cellphone_provider
  belongs_to :bathroom_n
  
  validate :no_of_bedrooms_corresponds_to_appt_type
  
  validates_presence_of(
          #ids
          :bathroom_n_id,
          :floor_type_id,
          :heat_q_id,
          :ac_type_id,
          :street_noise_level_id,
          :nbors_noise_level_id,
          :maintenance_q_id,
          :appliances_q_id,
          :bathroom_q_id,
          :cellphone_q_id,
          :cellphone_provider_id,

          #other
          :sq_footage,
          :ceiling_height,
          :broker_only, 
          :elevator, 
          :multi_level, 
          :penthouse, 
          :private_entrance, 
          :gym, 
          :laundry, 
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
          :cats_allowed)

  validates_numericality_of(
          :bathroom_n_id,
          :floor_type_id,
          :heat_q_id,
          :ac_type_id,
          :street_noise_level_id,
          :nbors_noise_level_id,
          :maintenance_q_id,
          :appliances_q_id,
          :bathroom_q_id,
          :cellphone_q_id,
          :cellphone_provider_id,

          #other
          :sq_footage,
          :ceiling_height,
          :broker_only, 
          :greater_than=>0, :only_integer=>true)
          
  validates_associated(
      :living_room, 
      :bed_rooms,
      :bathroom_n,
      :floor_type,
      :heat_q,
      :ac_type,
      :roof_access_type,
      :back_yard_type,
      :street_noise_level,
      :nbors_noise_level,
      :maintenance_q,
      :appliances_q,
      :bathroom_q,
      :cellphone_q,
      :cellphone_provider)

  
  
  
  def livingroom_info=(livingroom_info)
    #create
    if livingroom.nil?
      #on create it creates associations as well
      build_livingroom livingroom_info 
    else
      #on update it does not. NEED TO CALL SAVE EXPLICITLY
      livingroom.attributes = livingroom_info
    end
    
  end
  
  def bedrooms_info=(bedrooms_info)
    if bedrooms.size == 0
      bedrooms.build bedrooms_info
    else
      #form helper for [bedrooms_info][] indexes each bedroom by id. Does not save,  NEED TO CALL SAVE EXPLICITLY
      bedrooms.each {|bedroom| bedroom.attributes = bedrooms_info[bedroom.id.to_s]}
    end
  end
  
  def livingroom?
    !livingroom.nil?
  end
  
  def quiet?
    nbors_noise_level.most_desirable? && street_noise_level.most_desirable?
  end
  
  def no_of_bedrooms_corresponds_to_appt_type
    bedrooms.size == listing.apt_type.bedrooms
  end
  
end
