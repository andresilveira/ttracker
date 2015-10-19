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

    def scrap(item_name)
      @page = searcher.search_item(item_name)
      reader.read @page
    end
  end
end
