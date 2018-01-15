require 'rails_helper'

RSpec.describe Api::ItemsController, type: :controller do

  before do
    @list = create(:list)
  end

  describe "Items#create" do

    it "creates item" do
      allow(controller).to receive(:authenticated?)
      post :create, list_id: @list.id, item: { description: 'this is an item' }
      assert_equal 201, response.status
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      post :create, list_id: @list.id, item: { description: 'this is an item' }
      expect(response).to_not be_success
    end
  end

  describe "Items#update" do

    before do
      @item = create(:item)
    end

    it "successfully updates lists" do
      allow(controller).to receive(:authenticated?)
      patch :update, list_id: @list.id, id: @item.id,
                     item: { description: 'Update item' }

      assert_equal 200, response.status
      assert_equal 'Update item', @item.reload.description
    end

    it "unsuccessfully updates with no description" do
      allow(controller).to receive(:authenticated?)
      patch :update, list_id: @list.id, id: @item.id, item: { description: '' }

      assert_equal 422, response.status
    end
  end
end
