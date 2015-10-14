require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/show'

describe Web::Controllers::Items::Show do
  before { ItemRepository.clear }
  let(:item) { ItemRepository.create(Item.new(name: 'Large Jellopy')) }

  let(:action) { Web::Controllers::Items::Show.new }

  describe 'with valid parameters' do
    let(:params) { Hash[id: item.id] }

    it 'its successful' do
      response = action.call(params)
      response[0].must_equal 200
    end

    it 'exposes an item' do
      action.call(params)
      action.exposures[:item].must_equal item
    end
  end

  describe 'with invalid parameters' do
    let(:params) { Hash[id: ''] }

    it 'responds with 404' do
      response = action.call(params)
      response[0].must_equal 404
    end
  end
end
