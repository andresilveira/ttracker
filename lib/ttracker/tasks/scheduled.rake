namespace :scheduled do
  task :scraping do
    logger = Lotus::Logger.new
    logger.info 'Started scheduled scraping at: ' + Time.now.to_s
    data_source = Services::Scraper::Base.new username: ENV['T_USERNAME'], password: ENV['T_PASSWORD']

    ItemRepository.all.each do |item|
      Services::MarketEntriesMapper.new(data_source: data_source).update_market_entries(item)
      logger.info 'Scraped item: ' + item.name.to_s
    end

    logger.info 'Finished scheduled scraping at: ' + Time.now.to_s
  end
end
