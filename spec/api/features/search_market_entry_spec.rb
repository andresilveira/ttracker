require 'rack_test_helper'

describe 'Search Item', :vcr do
  it 'should return a json with jellopys' do
    post '/api/market_entries/search', query: 'jellopy'

    last_response.body.must_include 'jellopy'
  end
end
