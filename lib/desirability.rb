module Desirability

  #Given a range of attribute values, computes desirability 
  #Assumes that lower numeric values of IDs are more desirable
  
  MOST_DESIRABLE_ID = 1
  
  def desirable?(attribute_id)
    MOST_DESIRABLE == attribute_id
  end
  
  #is attribute_id1 more desirable than attribute_id2?
  def more_desirable?(attribute_id1, attribute_id2)
    attribute_id1 < attribute_id2
  end

end