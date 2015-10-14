class MarketEntryRepository
  include Lotus::Repository

  def self.find_by_item_id(item_id)
    query.where(item_id: item_id)
  end
end
