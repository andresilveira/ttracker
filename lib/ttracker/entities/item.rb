class Item
  include Lotus::Entity
  attributes :name

  attr_accessor :market_entries

  def market_entries
    @market_entries || []
  end

  attr_writer :market_entries
end
