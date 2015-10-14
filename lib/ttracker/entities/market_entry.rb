class MarketEntry
  include Lotus::Entity
  attributes :item_id, :name, :price, :amount, :vendor, :created_at, :updated_at
end
