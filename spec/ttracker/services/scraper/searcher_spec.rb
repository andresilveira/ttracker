require 'spec_helper'

describe Services::Scraper::Searcher, vcr: { record: :new_episodes} do
  let(:subject) { Services::Scraper::Searcher }

  it 'needs a knwon page' do
    proc { subject.new page: Minitest::Mock.new.expect(:uri, URI.parse('')) }.must_raise subject::UnknownPage
  end

  describe '#search_item' do
    it 'returns a page with the results' do
      page = Services::Scraper::Authenticator.new(
        username: ENV['T_USERNAME'], password: ENV['T_PASSWORD'], page: Mechanize.new.get(ENV['T_URL'])).authenticate!
      searcher = subject.new(page: page)
      results_page = searcher.search_item 'jellopy'

      results_page.search('#content_wrap > h3').text.downcase.must_include 'search results'
    end
  end
end
