require 'spec_helper'
require_relative '../../../../apps/api/views/market_entries/destroy'

describe Api::Views::MarketEntries::Destroy do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:view)      { Api::Views::MarketEntries::Destroy.new(nil, exposures) }
  let(:rendered)  { view.render }

  it 'renders an empty json' do
    rendered.must_equal JSON({})
  end
end
