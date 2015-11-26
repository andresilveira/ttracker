# Holds the criterias in which the price alerts are based

class PriceAlertCriteria
  include Lotus::Entity
  
  attributes :operation, :threshold, :item_id
  attr_accessor :item

  def achieved_threshold?(candidate)
    candidate.send(operation, threshold)
  end

  def item_name
    item.name
  end
end
