require 'rack_test_helper'

describe 'Search Item' do
  before { skip('test_remote env is false') unless ENV['TEST_REMOTE'] }
  it 'should return a json with jellopys' do
    post '/api/market_entries/search', query: 'jellopy'

    last_response.body.must_include 'jellopy'
  end
end
