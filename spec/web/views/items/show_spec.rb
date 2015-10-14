require 'spec_helper'
require_relative '../../../../apps/web/views/items/show'

describe Web::Views::Items::Show do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/items/show.html.haml') }
  let(:view)      { Web::Views::Items::Show.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
