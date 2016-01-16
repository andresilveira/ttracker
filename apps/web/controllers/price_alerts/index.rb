module Web::Controllers::PriceAlerts
  class Index
    include Web::Action

    expose :price_alerts

    def call(_)
      @price_alerts = PriceAlertCriteriaRepository.all
    end
  end
end
