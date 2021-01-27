require 'test_helper'

class AuthorizeRequestTest < ActiveSupport::TestCase
  test 'should authenticate request' do
    authorize_request_service = AuthorizeRequest.new(headers)
    assert_equal true, authorize_request_service.call
  end

  test 'should not authenticate request' do
    headers = {}
    authorize_request_service = AuthorizeRequest.new(headers)
    assert_nil authorize_request_service.call
  end

end
