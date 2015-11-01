module Api::Controllers::MarketEntries
  class Destroy
    include Api::Action

    def call(params)
      entry = MarketEntryRepository.find params[:id]
      halt 404 if entry.nil?

      MarketEntryRepository.delete(entry)
    end
  end
end
