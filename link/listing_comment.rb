class ListingComment < Comment
  belongs_to :listing, :counter_cache=>true
end
