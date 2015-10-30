require 'mechanize'
require_relative './authenticator'
require_relative './searcher'
require_relative './results_reader'

module Services
  module Scraper
    # The entry point for scraping the market website. It's composite of an Authenticator,
    # a Searcher and a Reader.
    # Given the credentials and the item name, it authenticates in the market website, performs
    # a search and parse the results
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
end
