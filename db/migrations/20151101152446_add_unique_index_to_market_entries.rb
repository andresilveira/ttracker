Lotus::Model.migration do
  change do
    add_index :market_entries, [:item_id, :vendor, :price, :amount], unique: true
  end
end
