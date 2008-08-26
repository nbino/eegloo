class AddTestData < ActiveRecord::Migration
  def self.up
     (1..100).each  do |i| 
      u = User.new(:username=>"user#{i}", :password=>"padboo7", :password_confirmation =>'padboo7', :email=>"user#{i}@email.com")
      
     u.listing = Listing.new(
    :user_id=>i+1, 
    :address=>"#{i} #{i} st", 
    :cross_street=>"#{i+3} st", 
    :apt_type_id=>AptType.find(:all)[rand(8)].id, 
    :nhood_id=>Nhood.find(:all)[rand(26)].id, 
    :rent_range_id=>RentRange.find(:all)[rand(10)].id,
    :avail_date=> "#{rand(11)+1}/#{rand(29)+1}/2008")
    :sq_footage=>(rand(10) + 5)  * 100,
    :ceiling_height=>rand(8)+10,
    :bathroom_n_id=>BathroomN.find(:all)[rand(4)].id,
    :floor_type_id=>FloorType.find(:all)[rand(3)].id,
    :heat_q_id=>HeatQ.find(:all)[rand(3)].id,
    :ac_type_id=>AcType.find(:all)[rand(4)].id,
    :roof_access_type_id=>RoofAccessType.find(:all)[rand(3)].id,
    :back_yard_type_id=>BackYardType.find(:all)[rand(3)].id,
    :street_noise_level_id=>StreetNoiseLevel.find(:all)[rand(3)].id,
    :nbors_noise_level_id=>NborsNoiseLevel.find(:all)[rand(3)].id,
    :maintenance_q_id=>MaintenanceQ.find(:all)[rand(3)].id,
    :appliances_q_id=>AppliancesQ.find(:all)[rand(3)].id,
    :bathroom_q_id=>BathroomQ.find(:all)[rand(3)].id,
    :cellphone_q_id=>CellphoneQ.find(:all)[rand(3)].id,
    :cellphone_provider_id=>CellphoneProvider.find(:all)[rand(6)].id,
    :dogs_allowed=>rand(2), 
    :cats_allowed=>rand(2), 
    :tenant_comment=>'This place is awesome',
    :broker_only=>rand(2), 
    :elevator=>rand(2), 
    :multi_level=>rand(2), 
    :penthouse=>rand(2),
    :private_entrance=>rand(2), 
    :gym=>rand(2), 
    :laundry=>rand(2), 
    :roaches=>rand(2), 
    :rodents=>rand(2), 
    :ants=>rand(2), 
    :broadband=>rand(2), 
    :doorman=>rand(2), 
    :rent_stabilized=>rand(2),
    :rent_controlled=>rand(2),
    :convertable=>rand(2),
    :separate_kitchen=>rand(2),
    :balcony=>rand(2),
    :patio=>rand(2),
    :loft=>rand(2)
        
   ) 
   
    u.listing.livingroom = Livingroom.new(
      :light_level_id=>LightLevel.find(:all)[rand(3)].id,
      :window_direction_id=>WindowDirection.find(:all)[rand(3)].id, 
      :length=>rand(6) + 6, 
      :width=>(rand(6) + 6)
    )
    
    u.listing.apt_type.bedrooms.times do |i|
      u.listing.bedrooms << Bedroom.new(
        :light_level_id=>LightLevel.find(:all)[rand(3)].id,
        :window_direction_id=>WindowDirection.find(:all)[rand(3)].id, 
        :length=>rand(12) + 6, 
        :width=>(rand(12) + 6)
    )
    end
    
    ["Kinda far from the subway", "Beautiful place but overpriced", "Loud construction on the block"].each do |comment|
      
        #~ v = Photo.create(
          #~ :listing_id=>i,
          #~ :comment=>"bedroom #{i+1}",
          #~ :uploaded_data => ActionController::TestUploadedFile.new("public/images/photo#{i}.jpg", 'image/jpg', :binary))
      
        
       u.listing.comments << ListingComment.new(
          :listing_id=>i,
          :user_id => rand (20) + 1,
          :content=>comment
          )
      
      end
        
   
   u.save
   
   end 
  end

  def self.down
    User.delete_all
    Visual.delete_all
    Listing.delete_all
    Comments.delete_all
  end
end
