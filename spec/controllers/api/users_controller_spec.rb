require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do

  describe "Users#index returns all users" do

    it 'success with authentication' do
      allow(controller).to receive(:authenticated?)
      get :index
      assert_equal 200, response.status
      assert_equal Mime::JSON, response.content_type
    end

    it "fails without authentication" do
      get :index
      assert_equal 401, response.status
    end
  end
end
