require 'features_helper'

describe 'Items' do
  before do
    ItemRepository.clear
    ItemRepository.create(Item.new(name: 'deleted item'))
  end

  after { ItemRepository.clear }

  it 'can delete an item' do
    visit '/items'

    within '#items' do
      find('.delete').click
    end

    current_path.must_equal('/items')
    page.assert_no_text 'deleted item'
  end
end

