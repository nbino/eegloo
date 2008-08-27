class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :nhood
 
      #basics
      t.string :address, :cross_street1, :cross_street2
      t.float :latitude, :longtitude
      t.datetime :avail_date
      t.integer
        :apt_no,
        :rent_range_top, 
        :rent_range_bottom, 
        :rent_exact
      
      #counts
      t.integer :bogus_flag_count, 
        :broker_flag_count, 
        :na_flag_count, 
        :favorites_count, 
        :listing_comments_count,
        :default=>0
        
      #apt info
      t.integer :sq_footage,
        :ceiling_height,
        :n_bathrooms,
        :floor_type_id,
        :heat_q_id,
        :ac_type_id,
        :back_yard,
        :street_noise_level_id,
        :nbors_noise_level_id,
        :appliances_q_id,
        :bathroom_q_id,
        :cellphone_q_id,
        :cellphone_provider_id
        
      t.boolean :private_back_yard
      
      
      #building info
      t.integer
        :maintenance_q_id,
        
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
        :roof_access,
        :public_back_yard,
        :dogs_allowed,
        :cats_allowed
      
      #other
      t.string :tenant_comment  
      
      t.timestamps
    end
 end

  def self.down
    drop_table :listings
  end
end
