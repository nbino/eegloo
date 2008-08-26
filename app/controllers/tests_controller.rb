class TestsController < ApplicationController
  
  def index
    @i=0
    
    ActionController::TestProcess.new
    
    Listing.find(:all).each do |l| 
      
      1..3.times do |i|
        v = Photo.create(
          :listing_id=>l.id,
          :comment=>"bedroom #{i}",
          :uploaded_data => fixture_file_upload("public/images/photo#{i}.jpg", 'image/jpg', :binary))
          
         @i = @i + 1 
      end
    end
  end
  
  
  
  
  
end
