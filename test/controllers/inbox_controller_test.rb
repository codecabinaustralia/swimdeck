require 'test_helper'

class InboxControllerTest < ActionDispatch::IntegrationTest
  test "should get inbox" do
    get inbox_inbox_url
    assert_response :success
  end

end
