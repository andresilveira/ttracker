# Holds the criterias in which the price alerts are based
class PriceAlertCriteria
  include Lotus::Entity

  ALLOWED_OPERATIONS = { '>=': 'greater than', '<=': 'smaller than' }.freeze

  attributes :operation, :threshold, :item_id
  attr_accessor :item

  def achieved_threshold?(candidate)
    candidate.send(operation, threshold)
  end

  def item
    @item ||= ItemRepository.find(item_id)
  end

  def item_name
    item.name
  end
end
