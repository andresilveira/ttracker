class ItemRepository
  include Lotus::Repository

  def self.find_with_market_entries(id)
    item = find(id)
    item.market_entries = MarketEntryRepository.find_by_item_id(id)
    item
  end
end
