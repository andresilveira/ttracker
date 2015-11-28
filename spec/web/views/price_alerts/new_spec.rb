require 'spec_helper'
require_relative '../../../../apps/web/views/price_alerts/new'

describe Web::Views::PriceAlerts::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/price_alerts/new.html.haml') }
  let(:view)      { Web::Views::PriceAlerts::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
