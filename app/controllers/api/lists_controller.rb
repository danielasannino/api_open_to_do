class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)

    if list.save
      render json: list, status: 201
    else
      render json: {}, status: 422
    end
  end

  def destroy
    list = List.find(params[:id])
    if (current_user == list.user) && list.destroy
      render json: {}, status: 204
    else
      render json: {}, status: 404
    end
  end

  def update
    list = List.find(params[:id])
    if (current_user == list.user) && list.update(list_params)
      render json: list, status: 200
    else
      render json: {}, status: 422
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :permissions)
  end
end
