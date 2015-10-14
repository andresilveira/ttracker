require 'spec_helper'

describe Item do
  it 'can be initialised with attributes' do
    item = Item.new(name: 'Large Jellopy')
    item.name.must_equal 'Large Jellopy'
  end
end
