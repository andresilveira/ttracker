require 'spec_helper'

describe MarketEntryRepository do
  before do
    MarketEntryRepository.clear
    ItemRepository.clear
  end
  let(:item1) { ItemRepository.create(Item.new(name: 'item1')) }
  let(:item2) { ItemRepository.create(Item.new(name: 'item2')) }

  describe 'database constraints' do
    it 'validates the uniqueness of a market_entry' do
      MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id))

      proc { MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id)) }.must_raise Sequel::UniqueConstraintViolation
    end
  end

  describe '.find_by_item_id' do
    it 'should contain only entries from the given item' do
      entry = MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id))
      MarketEntryRepository.find_by_item_id(item1.id).to_a.must_equal [entry]
    end
  end

  describe '.recently_created' do
    before do
      @new_entry = MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id, created_at: Date.today))
      @old_entry = MarketEntryRepository.create(MarketEntry.new(price: 2, amount: 1, vendor: 'dude', item_id: item1.id, created_at: Date.today - 1))
    end

    it 'should order the entries by its creation date' do
      MarketEntryRepository.recently_created.to_a.must_equal [@new_entry, @old_entry]
    end

    it 'should be able to limit the number of entries returned' do
      MarketEntryRepository.recently_created(limit: 1).to_a.must_equal [@new_entry]
    end
  end

  describe '.find_or_create' do
    it 'creates an entry if it doesnt exist already' do
      2.times { MarketEntryRepository.find_or_create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id)) }
      MarketEntryRepository.find_or_create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item2.id))

      MarketEntryRepository.all.size.must_equal 2
    end

    it 'returns either the newly created entry or the persisted one' do
      entry = MarketEntryRepository.find_or_create(MarketEntry.new(price: 1, amount: 1, vendor: 'dude', item_id: item1.id))
      entry.wont_be_nil
    end
  end
end
