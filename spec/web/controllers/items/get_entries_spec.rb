require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/get_entries'

describe Web::Controllers::Items::GetEntries do
  before do
    ItemRepository.clear
    @item = ItemRepository.create(Item.new(name: 'jellopy'))
  end

  let(:worker) do
    MiniTest::Mock.new.expect(:perform_async, true, [
      ENV['T_USERNAME'], ENV['T_PASSWORD'], @item.id
    ])
  end

  let(:action) { Web::Controllers::Items::GetEntries.new(worker) }
  let(:params) { Hash[id: @item.id] }

  it 'redirects to show item' do
    response = action.call(params)
    response[0].must_equal 302
    assert response[1]['Location'].must_equal("/items/#{@item.id}")
  end

  it 'exposes an item' do
    action.call(params)
    action.exposures[:item].must_equal @item
  end

  it 'should call map on the mapper' do
    action.call(params)
    worker.verify
  end
end
