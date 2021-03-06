# The bride betwen the entity MarketEntry and its persistence layer.
class MarketEntryRepository
  include Lotus::Repository

  # Gets all the market entries of a given item
  # @param item_id [Integer] The Item's id
  # @return [Lotus::Model::Adapters::Sql::Query] the set of market entries for the given item id
  def self.find_by_item_id(item_id)
    query.where(item_id: item_id)
  end

  # Orders the market entries by its creation date
  # @param limit [Integer, 20] the optional maximum number of market entries returned
  # @return [Lotus::Model::Adapters::Sql::Query] the ordered and limmited set of market entriies
  # @example
  #   MarketEntryRepository.recently_created(limit: nil)
  #     => #<Lotus::Model::Adapters::Sql::Query:0x007f9a71a08eb8
  #       @collection=#<Sequel::Postgres::Dataset: "SELECT * FROM \"market_entries\"">,
  #       @conditions=[[:order, #<Sequel::SQL::OrderedExpression @expression=>:created_at, @descending=>true, @nulls=>nil>], [:limit, nil]],
  #       @context=MarketEntryRepository>
  def self.recently_created(limit: 20)
    query.desc(:created_at).limit(limit)
  end

  # Persists a market entry if doesn't violates the unique constraint from the database
  # @param limit [MarketEntry] the market entry to be persisted
  # @return [MarketEntry] the new or previously persisted MarketEntry
  def self.find_or_create(entry)
    query.where(price: entry.price, vendor: entry.vendor, amount: entry.amount, item_id: entry.item_id).first || create(entry)
  end
end
