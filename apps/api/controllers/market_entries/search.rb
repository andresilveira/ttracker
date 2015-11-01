module Api::Controllers::MarketEntries
  class Search
    include Api::Action

    expose :market_entries

    def initialize(scraper = Services::Scraper::Base.new(username: ENV['T_USERNAME'], password: ENV['T_PASSWORD']))
      @scraper = scraper
    end

    def call(params)
      @market_entries = @scraper.scrap(params[:query])
      status 404, 'Item not found' if market_entries.empty?
    end
  end
end
