require 'features_helper'

describe 'List price alerts' do
  before do
    ItemRepository.clear
    PriceAlertCriteriaRepository.clear

    @item = ItemRepository.create(Item.new(name: 'Large Jellopy'))
    PriceAlertCriteriaRepository.create(
      PriceAlertCriteria.new(threshold: 500, operation: '>=', item_id: @item.id)
    )
  end

  it 'shows a item element for each item' do
    visit '/price_alerts'

    within '#price_alerts' do
      assert page.has_css?('.price_alert'), 'Expect to find 1 price alerts'
    end
  end
end
