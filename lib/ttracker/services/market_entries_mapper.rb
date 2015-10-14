module Services
  class MarketEntriesMapper
    def initialize(data_source:)
      @data_source = data_source
    end

    def update_market_entries(item)
      prepare_data_source(item)

      @data_source.select{|entry| entry[:name].casecmp(item.name) == 0}.each do |entry|
        MarketEntryRepository.create(MarketEntry.new(
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
      if @data_source.kind_of?(Services::Scrapper)
        @data_source = @data_source.scrap(item.name)
      end
    end
  end
end
