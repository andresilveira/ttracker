require 'features_helper'

describe 'Items' do
  before do
    ItemRepository.clear
  end

  it 'can create a new item' do
    visit '/items/new'
    within 'form#item-form' do
      fill_in 'Name', with: 'Large Jellopy'

      click_button 'Create'
    end

    assert page.has_content?('Large Jellopy')
  end
end
