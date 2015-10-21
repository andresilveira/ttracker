require 'features_helper'

describe 'Items', vcr: { record: :new_episodes } do
  before do
    ItemRepository.clear
    @item = ItemRepository.create(Item.new(name: 'jellopy'))
  end

  it 'can get entries from the market' do
    visit "/items/#{@item.id}"

    click_on 'Get Market Entries'

    within '#market_entries' do
      assert page.has_content?('123123123'), 'expected to find the entry price'
      assert page.has_content?('PintusHumunculus'), 'expected to find the entry vendor'
      assert page.has_content?('10'), 'expected to find the entry amount'
    end
  end
end
