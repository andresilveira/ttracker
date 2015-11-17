require 'lotus/model'
require 'lotus/mailer'
Dir["#{__dir__}/ttracker/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/ttracker_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/ttracker_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/ttracker_development'
  #    adapter type: :sql, uri: 'mysql://localhost/ttracker_development'
  #
  adapter type: :sql, uri: ENV['TTRACKER_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema 'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    # collection :users do
    #   entity     User
    #   repository UserRepository
    #
    #   attribute :id,   Integer
    #   attribute :name, String
    # end
    collection :items do
      entity Item
      repository ItemRepository

      attribute :id,    Integer
      attribute :name,  String
    end

    collection :market_entries do
      entity MarketEntry
      repository MarketEntryRepository

      attribute :id,          Integer
      attribute :item_id,     Integer
      attribute :price,       Integer
      attribute :amount,      Integer
      attribute :vendor,      String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end

    collection :price_alert_criterias do
      entity PriceAlertCriteria
      repository PriceAlertCriteriaRepository

      attribute :id,         Integer
      attribute :item_id,    Integer
      attribute :threshold,  Integer
      attribute :operation,     String
    end
  end
end.load!

Lotus::Mailer.configure do
  root "#{__dir__}/ttracker/mailers"

  # See http://lotusrb.org/guides/mailers/delivery
  delivery do
    development :test
    test :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
