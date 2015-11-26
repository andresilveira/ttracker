require 'spec_helper'
require_relative '../../../../apps/web/controllers/price_alerts/index'

describe Web::Controllers::PriceAlerts::Index do
  let(:action) { Web::Controllers::PriceAlerts::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes price_alerts' do
    action.call(params)
    action.price_alerts.wont_be_nil
  end
end
