require 'spec_helper'

describe Services::Scrapper, :vcr do
  it 'must have a username' do
    proc { Services::Scrapper.new(password: 'pass') }.must_raise ArgumentError
  end

  it 'must have a password' do
    proc { Services::Scrapper.new(username: 'user') }.must_raise ArgumentError
  end

  describe '#scrap' do
    let(:valid_credentials) { { username: ENV['T_USERNAME'], password: ENV['T_PASSWORD'] } }

    it 'should receive an item name' do
      proc { Services::Scrapper.new(valid_credentials).scrap }.must_raise ArgumentError
    end

    describe 'when the item exists' do
      let(:known_entry) { Hash[name: 'jellopy', cards: '', price: 123_123_123, amount: 10, title: 'ttracker'] }
      let(:results) { Services::Scrapper.new(valid_credentials).scrap(known_entry[:name]) }
      let(:fetched_known_entry) { results.find { |r| r[:title] == 'ttracker' } }

      it 'the results should include a jellopy' do
        fetched_known_entry[:name].must_equal 'jellopy'
      end

      it 'the results should include the price of 123123123' do
        fetched_known_entry[:price].must_equal 123_123_123
      end

      it 'the results should include the amount of 10' do
        fetched_known_entry[:amount].must_equal 10
      end

      it 'the results should include the vendor PintusHumunculus' do
        fetched_known_entry[:vendor].must_equal 'PintusHumunculus'
      end
    end

    describe 'when the item doesnt exist' do
      it 'returns an empty array' do
        Services::Scrapper.new(valid_credentials).scrap('unexisting_weird_item').must_be_empty
      end
    end
  end
end
