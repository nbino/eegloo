module AttributeLiterals
  
  NHOODS = [
    'Chelsea',
    'Columbus Circle',
    'East Village',
    'Financial District',
    'Flatiron',
    'Gramercy/Flatiron',
    'Greenwich Village',
    'Harlem',
    'Hell\'s Kitchen',
    'Lincoln Center',
    'Lower East Side',
    'Meatpacking District',
    'Midtown East',
    'Midtown West',
    'Murray Hill',
    'NoHo',
    'NoLita',
    'Rockefeller Center',
    'SoHo',
    'Theater District',
    'Times Square',
    'TriBeCa',
    'Union Square',
    'Upper East Side',
    'Upper West Side',
    'West Village']
    
  NOISE_LEVELS = ['quiet', 'average', 'loud']
  
  CELL_PROVIDERS = %w{Cingular Nextel Sprint T-Mobile Verizon other}
  
  CELL_SIGNAL_QUALITIES = %w{strong, ok, weak}
  
  CONDITIONS = %w{excellent, average, poor}
  
  FLOOR_TYPES = %w{hardwood, carpet, tile}
  
  AC_TYPES = %w{central, window, no}
  
  LIGHT_LEVELS = %w{dark, dim, bright}
  
  EXPOSURES = %w{north, east, south, west}
  
  WINDOW_DIRECTIONS = %w{garden, street, shaft}
  
end