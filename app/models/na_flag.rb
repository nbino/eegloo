class NaFlag < Flag
  belongs_to :listing, :counter_cache=>true
end
