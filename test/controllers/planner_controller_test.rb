require 'test_helper'

class PlannerControllerTest < ActionDispatch::IntegrationTest
  test "should get daily_planner" do
    get planner_daily_planner_url
    assert_response :success
  end

end
