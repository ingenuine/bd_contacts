class ApplicationController < ActionController::Base
  before_action :authenticate_request, if: :auth_enabled?

  def authenticate_request
    @current_user = AuthorizeRequest.new(request.headers).call
    render plain: 'Not Authorized', status: :unauthorized unless @current_user
  end

  def auth_enabled?
    ENV.fetch('AUTH_ENABLED', 'true').eql?('true')
  end
end
