module ListingsHelper

      
  
  #~ NHOODS = [
  #~ 'Chelsea',
  #~ 'Columbus Circle',
  #~ 'East Village',
  #~ 'Financial District',
  #~ 'Flatiron',
  #~ 'Gramercy/Flatiron',
  #~ 'Greenwich Village',
  #~ 'Harlem',
  #~ 'Hell\'s Kitchen',
  #~ 'Lincoln Center',
  #~ 'Lower East Side',
  #~ 'Meatpacking District',
  #~ 'Midtown East',
  #~ 'Midtown West',
  #~ 'Murray Hill',
  #~ 'NoHo',
  #~ 'NoLita',
  #~ 'Rockefeller Center',
  #~ 'SoHo',
  #~ 'Theater District',
  #~ 'Times Square',
  #~ 'TriBeCa',
  #~ 'Union Square',
  #~ 'Upper East Side',
  #~ 'Upper West Side',
  #~ 'West Village']
  
  #Need to load classes we are about to re- open first to make sure they are defined.
  Listing
  Room
  
  class ::Listing
  
    NOISE_LEVELS = %w{quiet average loud}
    
    CELL_PROVIDERS = %w{Cingular Nextel Sprint T-Mobile Verizon other}
    
    CELL_SIGNAL_QUALITIES = %w{strong, ok, weak}
    
    CONDITIONS = %w{excellent, average, poor}
    
    FLOOR_TYPES = %w{hardwood, carpet, tile}
    
    AC_TYPES = %w{central, window, no}
    
    #functions to translate id's to literals. ds = display string
    def apt_type
      n_bedrooms == 0 ? 'studio' : "#{n_bedrooms} bdr"
    end
    
    def nbors_noise_level_ds
      NOISE_LEVELS[nbors_noise_level]
    end
    
    def street_noise_level_ds
      NOISE_LEVELS[street_noise_level]
    end

    def cellphone_provider_ds
      CELL_PROVIDERS[cellphone_provider]
    end

    def cellphone_q_ds
      CELL_SIGNAL_QUALITIES[cellphone_q]
    end

    def appliance_q_ds
      CONDITIONS[appliance_q]
    end
      
    def maintenance_q_ds
      CONDITIONS[maintenance_q]
    end

    def bathroom_q_ds
      CONDITIONS[bathroom_q]
    end

    def heat_q_ds
      CONDITIONS[heat_q]
    end
      
    def floor_type_ds
      FLOOR_TYPES[floor_type]
    end
  end

  class ::Room

    EXPOSURES = %w{north, east, south, west}
    
    WINDOW_DIRECTIONS = %w{garden, street, shaft}
    
    LIGHT_LEVELS = %w{dark, dim, bright}

    def exposure_ds
      EXPOSURES[exposure]
    end
    
    def light_level_ds
      LIGHT_LEVELS[light_level]
    end
    
    def windows_facing_ds
      WONDOW_DIRECTIONS[windows_facing]
    end
    
  end
end
