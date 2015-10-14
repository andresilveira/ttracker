module Web::Controllers::Items
  class Show
    include Web::Action

    params do
      param :id, presence: true, type: Integer
    end

    expose :item

    def call(params)
      halt 404 unless params.valid?

      @item = ItemRepository.find_with_market_entries(params[:id])
    end
  end
end
