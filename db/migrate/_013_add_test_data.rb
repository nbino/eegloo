class AddTestData < ActiveRecord::Migration
  
  
  def self.up
     (1..100).each  do |i| 
      u = User.new(:username=>"user#{i}", :password=>"padboo7", :password_confirmation =>'padboo7', :email=>"user#{i}@email.com")
      
      u.listing = Listing.new(
        :address=>"#{i} #{ordinalize(i)} ave", 
        :cross_street1=>"#{ordinalize{i+10}} st", 
        :cross_street2=>"#{ordinalize{i+11}} st", 
        :bedrooms=>rand(6), 
        :nhood_id=>rand(26), 
        :rent_range=>rand(10),
        :avail_date=>"#{rand(11) + 1}/#{rand(29)+1}/2008"
        :sq_footage=>(rand(10) + 5)  * 100,
        :ceiling_height=>rand(8)+ 8,
        :bathroom_n=>rand(4),
        :floor_type=>rand(3),
        :heat_q=>rand(3),
        :ac_type=>rand(4),
        :roof_access_type=>rand(3),
        :back_yard_type=>rand(3),
        :street_noise_level=>rand(3),
        :nbors_noise_level=>rand(3),
        :maintenance_q=>rand(3),
        :appliances_q=>rand(3),
        :bathroom_q=>rand(3),
        :cellphone_q=>rand(3),
        :cellphone_provider=>rand(6),
        :dogs_allowed=>rand(2), 
        :cats_allowed=>rand(2), 
        :comment=>'This place is awesome',
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
      :light_level=>rand(3),
      :window_direction=>rand(3), 
      :size=>rand(10) * 50 + 50
    )
    
    u.listing.bedrooms.times do |i|
      u.listing.listing_info.bedrooms << Bedroom.new(
        :light_level=>rand(3),
        :window_direction=>rand(3), 
        :size=>rand(10) * 50 + 50, 
    )
    end
    
    #1..3.times do |i|
      
        #~ v = Photo.create(
          #~ :listing_id=>i,
          #~ :comment=>"bedroom #{i+1}",
          #~ :uploaded_data => ActionController::TestUploadedFile.new("public/images/photo#{i}.jpg", 'image/jpg', :binary))
      
        
       u.listing.comments << ListingComment.new(
          :user_id =>rand (20) + 1,
          :content=>["Kinda far from the subway", "Beautiful place but overpriced", "Loud construction on the block"][rand(3)]
          )
          
        
      
      
      
      end
        
   
   u.save
   
   end 
  end

  def self.down
    User.delete_all
    #Visual.delete_all
    Rooms.delete_all
    Listing.delete_all
  end
end
