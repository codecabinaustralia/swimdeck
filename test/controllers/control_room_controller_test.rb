require 'test_helper'

class ControlRoomControllerTest < ActionDispatch::IntegrationTest
  test "should get cockpit" do
    get control_room_cockpit_url
    assert_response :success
  end

end
