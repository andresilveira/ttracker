class Item
  class Name
    def initialize(raw_name)
      @raw_name = raw_name.to_s.downcase
    end

    def to_s
      @raw_name
    end

    def capitalize
      @raw_name.split.map(&:capitalize).join(' ')
    end
  end

  include Lotus::Entity
  attributes :name

  attr_accessor :market_entries

  def market_entries
    @market_entries || []
  end

  def name=(name)
    @name = Name.new(name).to_s
  end

  def name
    Name.new(@name).capitalize
  end
end
