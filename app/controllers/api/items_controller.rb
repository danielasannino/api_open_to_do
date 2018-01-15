class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item, status: 201
    else
      render json: {}, status: 422
    end
  end

  def update
    list = List.find(params[:list_id])
    item = Item.find(params[:id])
    if (current_user == item.list.user) && item.update(item_params)
      render json: item, status: 200
    else
      render json: {}, status: 422
    end
  end

  private

  def item_params
    params.require(:item).permit(:description, :completed)
  end
end
