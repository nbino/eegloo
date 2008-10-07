class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :nhood
 
      #basics
      t.string :address, :cross_street1, :cross_street2
      t.float :latitude, :longtitude
      t.datetime :avail_date
      t.integer :apt_no,
        :n_bedrooms,
        :rent_range_top, 
        :rent_range_bottom, 
        :rent,
        :sq_footage,
        :n_bathrooms
      
      #counts
      t.integer :bogus_flag_count, 
        :broker_flag_count, 
        :na_flag_count, 
        :favorites_count, 
        :listing_comments_count,
        :default=>0
        
      #apt info
      t.integer :ceiling_height,
        :floor_type,
        :heat_q,
        :private_back_yard,
        :street_noise_level,
        :nbors_noise_level,
        :appliances_q,
        :bathroom_q,
        :cellphone_q,
        :cellphone_provider,
        :maintenance_q
        
      t.boolean :private_back_yard,
        :broker_only, 
        :dogs_allowed,
        :cats_allowed,
        :multi_level, 
        :penthouse, 
        :private_entrance, 
        :roaches, 
        :rodents, 
        :ants,
        :bedbugs,
        :rent_stabilized,
        :rent_controlled,
        :convertable,
        :separate_kitchen,
        :balcony,
        :central_ac,
        :patio,
        :loft
      
      #building info
      t.boolean :elevator, 
        :gym, 
        :laundry, 
        :broadband, 
        :doorman, 
        :roof_access,
        :common_back_yard
      
      #other
      t.string :tenant_comment  
      
      t.timestamps
    end
 end

  def self.down
    drop_table :listings
  end
end
