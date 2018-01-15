class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(params.require(:list).permit(:name, :permissions))

    if list.save
      render json: list, status: 201
    end
  end
end
