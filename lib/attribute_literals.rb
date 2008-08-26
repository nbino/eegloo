class Listing
  
  NHOODS = [
    'Chelsea'
    'Columbus Circle'
    'East Village'
    'Financial District'
    'Flatiron'
    'Gramercy/Flatiron'
    'Greenwich Village'
    'Harlem'
    'Hell\'s Kitchen'
    'Lincoln Center'
    'Lower East Side'
    'Meatpacking District'
    'Midtown East'
    'Midtown West'
    'Murray Hill'
    'NoHo'
    'NoLita'
    'Rockefeller Center'
    'SoHo'
    'Theater District'
    'Times Square'
    'TriBeCa'
    'Union Square'
    'Upper East Side'
    'Upper West Side'
    'West Village']
    
  def nhood
    NHOODS[nhood_id]
  end
  
  NOISE_LEVELS = ['quiet', 'average', 'loud']
  
  def nbors_noise_level
    NOISE_LEVELS[nbors_noise_level_id]
  end
  
  def street_noise_level
    NOISE_LEVELS[street_noise_level_id]
  end
  
  CELL_PROVIDERS = %w{Cingular Nextel Sprint T-Mobile Verizon other}
  
  def cell_provider
    CELL_PROVIDERS[cellphone_q_id]
  end
  
  CELL_SIGNAL_QUALITIES %w{strong, ok, weak}
  
  def cell_signal_quality
    NHOOD_LITERALS[cellphone_q_id]
  end

  CONDITIONS %w{excellent, average, poor}
  
  def appl_condition
    CONDITIONS[appliance_q_id]
  end
    
  def maint_quality
    CONDITIONS[maintenance_q_id]
  end
  
  def bath_quality
    CONDITIONS[bathroom_q_id]
  end
  
  def heat
    CONDITIONS[heat_q_id]
  end
    
  
  FLOOR_TYPES = %w{hardwood, carpet, tile}
  def floor_type
    FLOOR_TYPES[floor_type_id]
  end
  
  AC_TYPES = %w{central, window, no}
  def nhood
    AC_TYPES[ac_type_id]
  end
  
  def nhood
    NHOOD_LITERALS[nhood_id]
  end
  
end 
 

class Room
  LIGHT_LEVELS = %w{dark, dim, bright}
  
  def light
    LIGHT_LEVELS[light_level_id]
  end
  
  EXPOSURES = %w{north, east, south, west}
  
  def exposure
    EXPOSURES[exposure_id]
  end
  
  WINDOW_DIRECTIONS = %w{garden, street, shaft}
  
  def window_direction
    WINDOW_DIRECTIONS [window_direction_id]
  end
  
end