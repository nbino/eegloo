class CreateListingInfos < ActiveRecord::Migration
  def self.up
    create_table :listing_infos do |t|
      t.integer :listing_id,
        :sq_footage,
        :ceiling_height,
        :bathroom_n_id,
        :floor_type_id,
        :heat_q_id,
        :ac_type_id,
        :roof_access_type_id,
        :back_yard_type_id,
        :street_noise_level_id,
        :nbors_noise_level_id,
        :maintenance_q_id,
        :appliances_q_id,
        :bathroom_q_id,
        :cellphone_q_id,
        :cellphone_provider_id
        
      t.string :landlord_phone_number, :broker_phone_number, :comment
      
      t.boolean :broker_only, 
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
        :cats_allowed

      t.timestamps
    end

    

  end



  def self.down
    drop_table :listing_infos
  end
end
