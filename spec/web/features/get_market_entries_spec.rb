require 'features_helper'

describe 'Items', vcr: { record: :new_episodes } do
  before do
    ItemRepository.clear
    @item = ItemRepository.create(Item.new(name: 'jellopy'))
  end

  it 'can get entries from the market' do
    visit "/items/#{@item.id}"

    click_on 'Get Market'

    assert page.has_content?("We're fetching data from the market for you. Please reload the page in a moment"), 'expected to give feedback to the user'
  end
end
