require 'spec_helper'

describe MarketEntry do
  let(:market_entry) { MarketEntry.new(name: 'Large Jellopy', price: 200, amount: 10) }

  it { market_entry.name.must_equal 'Large Jellopy' }
  it { market_entry.price.must_equal 200 }
  it { market_entry.amount.must_equal 10 }
end
