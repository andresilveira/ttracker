# Holds the criterias in which the price alerts are based

class PriceAlertCriteria
  include Lotus::Entity
  
  attributes :operation, :threshold, :item_id

  def achieved_threshold?(candidate)
    candidate.send(operation, threshold)
  end
end
