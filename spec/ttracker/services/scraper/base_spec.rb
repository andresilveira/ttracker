require 'spec_helper'

describe Services::Scraper::Base, vcr: { record: :new_episodes } do
  let(:subject) { Services::Scraper::Base }

  it 'must have a username' do
    proc { subject.new password: 'pass' }.must_raise ArgumentError
  end

  it 'must have a password' do
    proc { subject.new username: 'user' }.must_raise ArgumentError
  end

  describe '#scrap' do
    before do
      @authenticated_scraper = subject.new username: ENV['T_USERNAME'], password: ENV['T_PASSWORD']
    end

    it 'should receive an item name' do
      proc { @authenticated_scraper.scrap }.must_raise ArgumentError
    end

    describe 'when the item exists' do
      before do
        known_entry = Hash[name: 'jellopy', cards: '', price: 123_123_123, amount: 10, title: 'ttracker']
        results = @authenticated_scraper.scrap(known_entry[:name])
        @fetched_known_entry = results.find { |r| r[:title] == 'ttracker' }
      end

      it 'the results should include a jellopy' do
        @fetched_known_entry[:name].must_equal 'jellopy'
      end

      it 'the results should include the price of 123123123' do
        @fetched_known_entry[:price].must_equal 123_123_123
      end

      it 'the results should include the amount of 10' do
        @fetched_known_entry[:amount].must_equal 10
      end

      it 'the results should include the vendor PintusHumunculus' do
        @fetched_known_entry[:vendor].must_equal 'PintusHumunculus'
      end
    end

    describe 'when the item doesnt exist' do
      it 'returns an empty array' do
        @authenticated_scraper.scrap('unexisting_weird_item').must_be_empty
      end
    end
  end
end
