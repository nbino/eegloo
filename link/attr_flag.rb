class BrokerFlag < Flag
  belongs_to :listing, :counter_cache=>true
end
