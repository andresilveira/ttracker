require 'spec_helper'

describe MarketEntryRepository do
  before do
    MarketEntryRepository.clear
    ItemRepository.clear
  end
  let(:item1) { ItemRepository.create(Item.new(name: 'item1')) }
  let(:item2) { ItemRepository.create(Item.new(name: 'item2')) }

  describe '.find_by_item_id' do
    it 'should contain only entries from the given item' do
      entry = MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id))
      MarketEntryRepository.find_by_item_id(item1.id).to_a.must_equal [entry]
    end
  end

  describe '.recently_created' do
    before do
      @new_entry = MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id, created_at: Date.today))
      @old_entry = MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id, created_at: Date.today - 1))
    end

    it 'should order the entries by its creation date' do
      MarketEntryRepository.recently_created.to_a.must_equal [@new_entry, @old_entry]
    end

    it 'should be able to limit the number of entries returned' do
      MarketEntryRepository.recently_created(limit: 1).to_a.must_equal [@new_entry]
    end
  end
end
