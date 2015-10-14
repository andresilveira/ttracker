require 'features_helper'

describe 'List items' do
  before do
    ItemRepository.clear

    ItemRepository.create(Item.new(name: 'Large Jellopy'))
    ItemRepository.create(Item.new(name: 'Talan Coin'))
  end

  it 'shows a item element for each item' do
    visit '/items'

    within '#items' do
      assert page.has_css?('.item', count: 2), 'Expect to find 2 books'
    end
  end
end
