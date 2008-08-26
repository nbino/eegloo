class Visual < ActiveRecord::Base
  
  belongs_to :listing
  
  has_attachment :content_type => :image, 
                        :storage => :file_system,
  #                      :processor => :mini_magick,                        
  #                      :max_size => 1000.kilobytes,
  #                      :resize_to => '320x200>',
  #                      :thumbnails => { :thumb => '100x100>' },
                        :size => 0.kilobytes..1000.kilobytes

  validates_as_attachment
  
end
