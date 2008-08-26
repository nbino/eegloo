class Room < ActiveRecord::Base
  belongs_to :apt_info
  belongs_to :light_level
  belongs_to :window_direction
  belongs_to :bed_type
end
