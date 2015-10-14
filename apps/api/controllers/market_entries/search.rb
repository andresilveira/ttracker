module Api::Controllers::MarketEntries
  class Search
    include Api::Action

    expose :market_entries

    def initialize(scrapper = Services::Scrapper.new(username: ENV['T_USERNAME'], password: ENV['T_PASSWORD']))
      @scrapper = scrapper
    end

    def call(params)
      @market_entries = @scrapper.scrap(params[:query])
      if market_entries.empty?
        status 404, 'Item not found'
      end
    end
  end
end
