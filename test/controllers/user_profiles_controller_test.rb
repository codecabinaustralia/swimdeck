require 'test_helper'

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get user_profiles_admin_url
    assert_response :success
  end

  test "should get manager" do
    get user_profiles_manager_url
    assert_response :success
  end

  test "should get pool_deck_leader" do
    get user_profiles_pool_deck_leader_url
    assert_response :success
  end

  test "should get customer_service" do
    get user_profiles_customer_service_url
    assert_response :success
  end

  test "should get client" do
    get user_profiles_client_url
    assert_response :success
  end

end
