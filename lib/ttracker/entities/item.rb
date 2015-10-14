class Item
  include Lotus::Entity
  attributes :name

  attr_accessor :market_entries

  def market_entries
    @market_entries || []
  end

  def market_entries= entries
    @market_entries= entries
  end
end
