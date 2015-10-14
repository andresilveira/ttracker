require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/index'

describe Web::Controllers::Items::Index do
  let(:action) { Web::Controllers::Items::Index.new }
  let(:params) { Hash[] }

  before do
    ItemRepository.clear

    @item = ItemRepository.create(Item.new(name: 'Large Jellopy'))
  end

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all items' do
    action.call(params)
    action.exposures[:items].must_equal [@item]
  end
end
