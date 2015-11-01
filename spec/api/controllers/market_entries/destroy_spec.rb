require 'spec_helper'
require_relative '../../../../apps/api/controllers/market_entries/destroy'

describe Api::Controllers::MarketEntries::Destroy do
  let(:action) { Api::Controllers::MarketEntries::Destroy.new }
  let(:market_entry) { MarketEntryRepository.create(MarketEntry.new(price: 1, amount: 1, vendor: 'someone')) }
  let(:params) { Hash[id: market_entry.id] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'destroys the market entry for the repository' do
    action.call(params)
    MarketEntryRepository.find(market_entry.id).must_be_nil
  end

  it 'should return 404 when the entry is not found' do
    response = action.call(Hash[id: 0])
    response[0].must_equal 404
  end
end
