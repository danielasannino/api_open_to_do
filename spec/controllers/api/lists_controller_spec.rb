require 'rails_helper'

RSpec.describe Api::ListsController, type: :controller do

  before do
    @user = create(:user)
  end

  describe "Lists#create" do

    it "creates list" do
      allow(controller).to receive(:authenticated?)
      post :create, user_id: @user.id,
                    list: { name: 'list', permissions: 'public' }
      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      post :create, user_id: @user.id,
                    list: { name: 'list', permissions: 'public' }
      expect(response).to_not be_success
    end
  end

  describe "Lists#destroy" do

    before do
      @list = create(:list)
    end

    it "deletes existing list" do
      allow(controller).to receive(:authenticated?)
      delete :destroy, user_id: @user.id, id: @list.id
      assert_equal 204, response.status
    end
  end

  describe "Lists#update" do

    before do
      @list = create(:list)
    end

    it "successfully updates lists" do
      allow(controller).to receive(:authenticated?)
      patch :update, user_id: @user.id, id: @list.id, list: { name: 'Update' }

      assert_equal 200, response.status
      assert_equal 'Update', @list.reload.name
    end

    it "unsuccessfully updates with no name" do
      allow(controller).to receive(:authenticated?)
      patch :update, user_id: @user.id, id: @list.id, list: { name: '' }

      assert_equal 422, response.status
    end
  end
end
