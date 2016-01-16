require 'spec_helper'
require_relative '../../../../apps/web/controllers/price_alerts/new'

describe Web::Controllers::PriceAlerts::New do
  let(:action) { Web::Controllers::PriceAlerts::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  describe 'items' do
    before do
      ItemRepository.clear
      @item = ItemRepository.create(Item.new(name: 'jellopy'))
    end

    it 'exposes items' do
      action.prepare_items_options.must_equal Hash[@item.id.to_s => @item.name]
    end
  end

  it 'exposes operations' do
    action.prepare_operations_options[:>=].must_equal('greater than')
    action.prepare_operations_options[:<=].must_equal('smaller than')
  end
end
