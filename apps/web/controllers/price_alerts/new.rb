module Web::Controllers::PriceAlerts
  class New
    include Web::Action

    expose :items, :operations

    def call(params)
      @items = prepare_items_options
      @operations = prepare_operations_options
    end

    def prepare_items_options(items_set = ItemRepository.all)
      items = {}
      items_set.each { |item| items[item.id.to_s] = item.name.to_s }
      items
    end

    def prepare_operations_options
      PriceAlertCriteria::ALLOWED_OPERATIONS
    end
  end
end
