require 'features_helper'

describe 'Items' do
  before do
    ItemRepository.clear
    ItemRepository.create(Item.new(name: 'deleted item'))
  end

  it 'can delete an item' do
    visit '/items'

    within '#items' do
      find('.delete').click
    end

    page.assert_no_text 'deleted item'
  end
end
