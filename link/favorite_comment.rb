class FavoriteComment < Comment
  belongs_to :favorite, :counter_cache=>true
end
