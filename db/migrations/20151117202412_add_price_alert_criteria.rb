Lotus::Model.migration do
  change do
    create_table :price_alert_criterias do
      primary_key :id
      foreign_key :item_id, :items, index: true, on_delete: :cascade
      column :threshold,    Integer, null: false
      column :operation,    String, null: false
    end
  end
end
