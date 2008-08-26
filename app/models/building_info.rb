class BuildingInfo < ActiveRecord::Base
  belongs_to :roof_access_type
  belongs_to :back_yard_type
  
  MAX_BATHROOMS = 3
    
  validates_presence_of(
          #ids
          :roof_access_type_id,
          :back_yard_type_id,
          :street_noise_level_id,
          
          #other
          :elevator, 
          :multi_level, 
          :penthouse, 
          :private_entrance, 
          :gym, 
          :laundry, 
          :broadband, 
          :doorman, 
          :rent_stabilized,
          :rent_controlled,
          )

  validates_numericality_of(
          :roof_access_type_id,
          :back_yard_type_id,
          :greater_than=>0, :only_integer=>true)
          
  validates_associated(
      :roof_access_type,
      :back_yard_type)

  def quiet?
    nbors_noise_level.most_desirable? && street_noise_level.most_desirable?
  end
  
  protected
  
  def no_of_bedrooms_corresponds_to_appt_type
    bedrooms.size == listing.apt_type.bedrooms
  end
  
end
