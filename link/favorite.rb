class Favorite < ActiveRecord::Base
  belongs_to :listing, :counter_cache=>true
  belongs_to :user
  validates_uniqueness_of :listing_id, :scope => [:user_id]
  
  
  SORT_ORDER =
  {
    'created_at' => 'listings.created_at DESC',
    'favorites_count' => 'listings.favorites_count DESC',
    'lbound' => 'rent_ranges.lbound ASC'
  }
  
  def favorite?
    true
  end
  
  
  # Decided not to cache favorites count for users, not very useful
  
  #after_create :increment_listing_counter_cache
  #after_destroy :decrement_listing_counter_cache
  
  
  # favorites should be added through User.favorites.create to increment User's favorites_count. The below is to also increment listings favorites_count as there doesn't seem to be a clean way to do that
  
  #~ def increment_listing_counter_cache
    #~ listing.increment_counter 'favorites_count', self.listing_id
  #~ end
  
  #~ def decrement_listing_counter_cache
    #~ listing.decrement_counter 'favorites_count', self.listing_id
  #~ end
  
end
