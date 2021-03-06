module Services
  # Responsible for mapping the results of the market website scraper into
  # known Entities: MarketEntry and Item
  class MarketEntriesMapper
    def initialize(data_source:)
      @data_source = data_source
    end

    def update_market_entries(item)
      prepare_data_source(item)
      return if @data_source.empty?

      exact_matches_for_item(item).each do |entry|
        MarketEntryRepository.find_or_create(
          MarketEntry.new(
            amount:   entry[:amount].to_i,
            price:    entry[:price].to_i,
            vendor:   entry[:vendor].to_s,
            item_id:  item.id
          )
        )
      end

      ItemRepository.find_with_market_entries(item.id)
    end

    private

    def prepare_data_source(item)
      return unless @data_source.is_a?(Services::Scraper::Base)

      @data_source = @data_source.scrap(item.name)
    end

    def exact_matches_for_item(item)
      @data_source.select { |entry| entry[:name].casecmp(item.name) == 0 }
    end
  end
end
