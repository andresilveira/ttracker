module Api::Views::MarketEntries
  class Search
    include Api::View

    def render
      market_entries.to_json
    end
  end
end
