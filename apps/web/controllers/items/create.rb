module Web::Controllers::Items
  class Create
    include Web::Action

    expose :item

    params do
      param :item do
        param :name, presence: true
      end
    end

    def call(params)
      if params.valid?
        @item = ItemRepository.create(Item.new(params[:item]))

        redirect_to routes.items_path
      end
    end
  end
end
