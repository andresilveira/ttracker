require 'spec_helper'

describe Services::MarketEntriesMapper do
  before do
    ItemRepository.clear
    @item = ItemRepository.create(Item.new(name: 'jellopy'))
    @data_source = [
      { name: 'jellopy', price: 123_123, amount: 10, vendor: 'someone' },
      { name: 'large jellopy', price: 123_123, amount: 10, vendor: 'someone' }
    ]
  end

  it 'must have a data_source' do
    proc { Services::MarketEntriesMapper.new }.must_raise ArgumentError
  end

  it 'must create market_entries for the given item' do
    Services::MarketEntriesMapper.new(
      data_source:  @data_source
    ).update_market_entries(@item)

    @item = ItemRepository.find_with_market_entries(@item.id)
    @item.market_entries.count.must_equal 1
  end
end
