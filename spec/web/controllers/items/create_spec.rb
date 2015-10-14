require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/create'

describe Web::Controllers::Items::Create do
  let(:action) { Web::Controllers::Items::Create.new }

  before { ItemRepository.clear }

  describe 'with valid params' do
    let(:params) { Hash[item: { name: 'Large Jellopy' }] }

    it 'creates a new item' do
      action.call(params)
      action.item.id.wont_be_nil
    end

    it 'redirects the user to the items listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/items'
    end
  end

  describe 'with an empty name' do
    let(:params) { Hash[item: {}] }
    it 're-renders the items#new view' do
      response = action.call(params)
      response[0].must_equal 200
    end
  end
end
