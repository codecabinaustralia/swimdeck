require 'test_helper'

class CompetencyLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competency_level = competency_levels(:one)
  end

  test "should get index" do
    get competency_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_competency_level_url
    assert_response :success
  end

  test "should create competency_level" do
    assert_difference('CompetencyLevel.count') do
      post competency_levels_url, params: { competency_level: { title: @competency_level.title } }
    end

    assert_redirected_to competency_level_url(CompetencyLevel.last)
  end

  test "should show competency_level" do
    get competency_level_url(@competency_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_competency_level_url(@competency_level)
    assert_response :success
  end

  test "should update competency_level" do
    patch competency_level_url(@competency_level), params: { competency_level: { title: @competency_level.title } }
    assert_redirected_to competency_level_url(@competency_level)
  end

  test "should destroy competency_level" do
    assert_difference('CompetencyLevel.count', -1) do
      delete competency_level_url(@competency_level)
    end

    assert_redirected_to competency_levels_url
  end
end
