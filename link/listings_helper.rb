module ListingsHelper

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
    'West Village'];
    
  def nhood
    NHOOD_LITERALS[nhood_id]
  end
   
   NOISE_LEVELS = ['a lot of','average','quiet']

  def nbors_noise_level
    NOISE_LEVELS[nbors_noise_level_id]
  end
  
  def street_noise_level
    NOISE_LEVELS[nbors_noise_level_id]
  end

  CELLPHONE_PROVIDERS =%w{Cingular Nextel Virgin Sprint T-Mobile Verizon}

  def cellphone_provider
    CELLPHONE_PROVIDERS[nhood_id]
  end

  QUALITY = %w{poor average excellent}
  
  def heat_q
    QUALITY[nbors_noise_level_id]
  end
  
  def bathroom_q
    QUALITY[bathroom_q]
  end
      
  def appliances_q
    QUALITY[appliances_q]
  end
  
  def cellphone_q
    QUALITY[cellphone_q]
  end
  
  
  FLOOR_TYPE = %w{linoleum carpet hardwood}
   
  def floor_type_id
    FLOOR_TYPE[flooe_type_id]
  end
  
  AC_TYPE = %w(no window wall central)
  
  def ac_type_id
    AC_TYPE[flooe_type_id]
  end
  
  BACKYARD_TYPE = %w(private public)
  
  def backyard_type_id
    BACKYARD[flooe_type_id]
  end
  
end 
 
  class Room
  
    LIGHT_LEVELS = %W{dark dim light}
  
    def light_level
      FLOOR[flooe_type_id]
    end
    
    EXPOSURE = %W{north east south west}
    
    def exposure
      FLOOR[exposure_id]
    end
    
    SIZE = %W{small average large}
    
    def size
      SIZE[size_id]
    end

  end    
  
end
