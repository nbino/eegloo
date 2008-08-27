require 'attribute_literals'

class Room < ActiveRecord::Base
  belongs_to :listing
  
  def light
    AttributeLiterals::LIGHT_LEVELS[light_level_id]
  end
  
  def exposure
    AttributeLiterals::EXPOSURES[exposure_id]
  end
  
  def window_direction
    AttributeLiterals::WINDOW_DIRECTIONS [window_direction_id]
  end
  
end
