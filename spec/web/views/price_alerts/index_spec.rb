require 'spec_helper'
require_relative '../../../../apps/web/views/price_alerts/index'

describe Web::Views::PriceAlerts::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/price_alerts/index.html.haml') }
  let(:view)      { Web::Views::PriceAlerts::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
