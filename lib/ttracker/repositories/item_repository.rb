# The bridge between the entity Item and its persistence layer.
class ItemRepository
  include Lotus::Repository

  # Finds an Item by its id and fills its market_entries attribute with its market entries
  # @param id [Integer] the Item's id
  # @return [Item] the item searched
  # TODO: chaining the recently_created method with MarketEntryRepository is not a really good
  # idea since we're now having multiple responsabilities in the method. When lotus release
  # its association infrastructure we can change this by loading the market_entries at loading
  # time.
  def self.find_with_market_entries(id)
    item = find(id)
    item.market_entries = MarketEntryRepository.find_by_item_id(id).recently_created
    item
  end
end
