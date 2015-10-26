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

    it 'should call search_item on its searcher' do
      item_name = 'item_name'
      mock_searcher = Minitest::Mock.new.expect(:search_item, true, [item_name])
      @authenticated_scraper.searcher = mock_searcher

      @authenticated_scraper.reader.stub :read, true do
        @authenticated_scraper.scrap(item_name)
      end
      mock_searcher.verify
    end

    it 'should call read on its reader' do
      mock_reader = Minitest::Mock.new.expect(:read, true, [Mechanize::Page])
      @authenticated_scraper.reader = mock_reader
      @authenticated_scraper.scrap('item_name')
      mock_reader.verify
    end
  end
end
