class AptType < ActiveRecord::Base
  
  def livingroom?
    !name.include?('studio')
  end
  
  def to_s
    name
  end
  
    
end
