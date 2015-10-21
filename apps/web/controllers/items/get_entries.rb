module Web::Controllers::Items
  class GetEntries
    include Web::Action

    expose :item

    def initialize(mapper = nil, data_source = nil)
      @data_source = data_source || Services::Scraper::Base.new(
        username: ENV['T_USERNAME'],
        password: ENV['T_PASSWORD']
      )
      @mapper = mapper || Services::MarketEntriesMapper.new(data_source: @data_source)
    end

    def call(params)
      @item = @mapper.update_market_entries(ItemRepository.find(params[:id]))

      redirect_to routes.item_path(@item.id)
    end
  end
end
