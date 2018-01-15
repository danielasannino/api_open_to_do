class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.find(params[:list_id])
    item = list.items.build(params.require(:item).permit(:description))

    if item.save
      render json: item, status: 201
    end
  end
end
