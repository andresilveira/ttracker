require_relative '../../../config/environment'
require 'sidekiq'

module Workers
  class EntriesGetter
    include Sidekiq::Worker

    def perform(username, password, item_id)
      item = ItemRepository.find item_id

      data_source = Services::Scrapper.new username: username, password: password

      Services::MarketEntriesMapper.new(data_source: data_source).update_market_entries(item)
    end
  end
end
