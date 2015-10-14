module Web::Controllers::Items
  class Destroy
    include Web::Action

    params do
      param :id, presence: true, type: Integer
    end

    def call(params)
      halt 404 unless params.valid?

      ItemRepository.delete(Item.new(id: params[:id]))
      redirect_to routes.items_path
    end
  end
end
