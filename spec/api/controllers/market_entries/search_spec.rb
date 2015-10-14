require 'spec_helper'
require_relative '../../../../apps/api/controllers/market_entries/search'

describe Api::Controllers::MarketEntries::Search do
  before { @scrapper = MiniTest::Mock.new }
  let(:action) { Api::Controllers::MarketEntries::Search.new(@scrapper) }

  describe 'when the search finds a result' do
    let(:params) { Hash[query: 'jellopy'] }

    before { @scrapper.expect(:scrap, [:entry], ['jellopy']) }

    it 'should pass the query to scrapper' do
      action.call(params)

      @scrapper.verify
    end

    it 'is successful' do
      response = action.call(params)
      response[0].must_equal 200
    end

    it 'exposes a list of market_entries' do
      action.call(params)
      action.market_entries.must_equal [:entry]
    end
  end

  describe 'when the search finds no result' do
    let(:params) { Hash[query: 'unknown_item'] }

    it 'is successful' do
      @scrapper.expect(:scrap, [], ['unknown_item'])
      response = action.call(params)
      response[0].must_equal 404
    end
  end
end
