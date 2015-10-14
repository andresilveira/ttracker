require 'mechanize'

module Services
  class Scrapper
    attr_reader :username, :password, :item_name

    WHOSELL_URL = ENV['T_URL']

    def initialize(username:, password:)
      @username = username
      @password = password
    end

    def scrap(item_name)
      # initializes agent and get the page
      page = Mechanize.new.get(WHOSELL_URL)

      # authenticate
      page = page.form_with(id: 'validation') do |login|
        login.field_with(name: 'auth').value = username
        login.field_with(name: 'password').value = password
      end.submit

      # query for the item name
      page = page.form_with(id: 'validation') do |whosell|
        whosell.field_with(name: 'name').value = item_name
      end.submit

      # scrapps the page for results
      item_entries = page.search('#content_wrap > .table_data tr:not(.table_row_subtop)').search('tr:not(.table_row_top)')

      # map the results into MarketEntry objects
      item_entries.map do |entry|
        entry = entry.children.select { |child| child.name == 'td' }
        {
          name:   entry[0].text.strip.downcase,
          cards:  entry[1].text.strip.downcase,
          price:  entry[2].text.strip.delete('.').to_i,
          amount: entry[3].text.strip.delete('.').to_i,
          title:  entry[4].text.strip.downcase,
          vendor: entry[5].text.strip
        }
      end
    end
  end
end
