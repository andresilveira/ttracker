require 'spec_helper'

describe ItemRepository do
  before do
    ItemRepository.clear
    MarketEntryRepository.clear
  end

  describe '.find_with_market_entries' do
    let(:item_with_entries) { ItemRepository.create(Item.new(name: 'jellopy')) }
    before do
      MarketEntryRepository.create(
        MarketEntry.new(
          price:     123,
          amount:    10,
          vendor:   'someone',
          item_id:   item_with_entries.id
        )
      )
    end

    it 'should load also the market entries for a given item' do
      item = ItemRepository.find_with_market_entries(item_with_entries.id)
      item.market_entries.wont_be_empty
    end
  end
end
