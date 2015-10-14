Lotus::Model.migration do
  change do
    create_table :market_entries do
      primary_key :id
      foreign_key :item_id, :items, index: true, on_delete: :cascade
      column :price,      Integer,  null: false
      column :amount,     Integer,  null: false
      column :vendor,     String,   null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime
    end
  end
end
