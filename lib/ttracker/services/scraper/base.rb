require 'mechanize'

module Services::Scraper
  class Base
    attr_accessor :username, :password, :item_name, :authenticator,
                  :searcher, :reader

    WHOSELL_URL = ENV['T_URL']

    def initialize(username:, password:, authenticator: nil, searcher: nil, reader: nil)
      self.username = username
      self.password = password
      self.authenticator = authenticator || Authenticator.new(
        username: username, password: password, page: Mechanize.new.get(WHOSELL_URL)
      )

      @page = self.authenticator.authenticate!

      self.searcher = searcher || Searcher.new(page: @page)
      self.reader = reader || ResultsReader.new
    end

    def scrap(item_or_items_names)
      items_names = Array(item_or_items_names)
      items_names.flat_map do |item_name|
        @page = searcher.search_item(item_name)
        results = reader.read @page
        yield results if block_given?
        results
      end
    end
  end
end
