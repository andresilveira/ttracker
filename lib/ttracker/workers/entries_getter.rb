require 'sidekiq'

module Workers
  class EntriesGetter
    include Sidekiq::Worker

    def perform(username, password, item_id)
      item = ItemRepository.find item_id

      data_source = Services::Scraper::Base.new username: username, password: password

      Services::MarketEntriesMapper.new(data_source: data_source).update_market_entries(item)
    end
  end
end
