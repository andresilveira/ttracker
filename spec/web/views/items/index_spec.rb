require 'spec_helper'
require_relative '../../../../apps/web/views/items/index'

describe Web::Views::Items::Index do
  let(:exposures) { Hash[items: []] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/items/index.html.haml') }
  let(:view)      { Web::Views::Items::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #items" do
    view.items.must_equal exposures.fetch(:items)
  end

  describe 'when there are no items' do
    it 'shows a placeholder message' do
      rendered.must_include('There are no items yet.')
    end
  end

  describe 'when there are items' do
    let(:item1)     { Item.new(id: 1, name: 'Large Jellopy') }
    let(:item2)     { Item.new(id: 2, name: 'Talan Coin') }
    let(:exposures) { Hash[items: [item1, item2]] }

    it 'lists them all' do
      rendered.scan(/class='item'/).count.must_equal 2
      rendered.must_include('Large Jellopy')
      rendered.must_include('Talan Coin')
    end

    it 'hides the place holder message' do
      view.render.wont_include('There are no items yet.')
    end
  end
end
