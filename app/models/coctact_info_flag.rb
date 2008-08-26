class BogusFlag < Flag
  belongs_to :listing, :counter_cache=>true
end
