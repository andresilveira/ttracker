require 'spec_helper'
require_relative '../../../../apps/web/controllers/items/destroy'

describe Web::Controllers::Items::Destroy do
  before do
    ItemRepository.clear
    @item = ItemRepository.create(Item.new(name: 'Large Jellopy'))
  end

  let(:action) { Web::Controllers::Items::Destroy.new }

  describe 'with valid parameters' do
    let(:params){ Hash[id: @item.id] }

    it "redirects the user" do
      response = action.call(params)
      response[0].must_equal 302
    end

    it "deletes the given item" do
      response = action.call(params)
      ItemRepository.find(@item.id).must_be_nil
    end
  end

  describe 'with invalid parameters' do
    let(:params){ Hash[id: ''] }

    it "responds with 404" do
      response = action.call(params)
      response[0].must_equal 404
    end
  end
end
