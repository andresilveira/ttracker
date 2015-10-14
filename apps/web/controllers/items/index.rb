module Web::Controllers::Items
  class Index
    include Web::Action

    expose :items

    def call(_params)
      @items = ItemRepository.all
    end
  end
end
