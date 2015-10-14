require 'features_helper'

describe 'Show item' do
  before do
    ItemRepository.clear

    ItemRepository.create(Item.new(name: 'Large Jellopy'))
  end

  it "shows an item and its market entries" do
    visit "/items"

    click_on 'Large Jellopy'

    assert page.has_text?('Large Jellopy'), 'Expect to find the items name'
  end
end
