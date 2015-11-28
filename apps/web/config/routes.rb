resources :price_alerts, only: [:index, :new]

resources :items do
  member do
    put '/get_entries'
  end
end
# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage

get '/', to: 'items#index', as: :root
