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
      return unless params.valid?

      @item = ItemRepository.create(Item.new(params[:item]))
      redirect_to routes.item_path(@item.id)
    end
  end
end
