resources :market_entries, only: [:destroy] do
  collection do
    post '/search'
  end
end
# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
