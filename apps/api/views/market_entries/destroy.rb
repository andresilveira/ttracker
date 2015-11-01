module Api::Views::MarketEntries
  class Destroy
    include Api::View

    def render
      {}.to_json
    end
  end
end
