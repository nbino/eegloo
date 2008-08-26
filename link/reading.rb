class Reading < ActiveRecord::Base
  validates_uniqueness_of :listing_id, :scope => [:user_id]
  belongs_to :user
  belongs_to :listing
end
