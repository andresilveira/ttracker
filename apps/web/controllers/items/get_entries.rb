module Web::Controllers::Items
  class GetEntries
    include Web::Action

    expose :item

    def initialize(worker = Workers::EntriesGetter)
      @worker = worker
    end

    def call(params)
      @worker.perform_async ENV['T_USERNAME'], ENV['T_PASSWORD'], params[:id]
      @item = ItemRepository.find(params[:id])
      flash[:info] = "<i class='fa fa-spin fa-cog' aria-hidden='true'></i> We're fetching data from the market for you. Please reload the page in a moment"
      redirect_to routes.item_path(@item.id)
    end
  end
end
