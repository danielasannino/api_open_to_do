class ApiController < ApplicationController
    skip_before_action :verify_authenticity_token
    attr_reader :current_user

    private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.where( username: username, password: password).first
      @current_user.present?
    end
  end
end
