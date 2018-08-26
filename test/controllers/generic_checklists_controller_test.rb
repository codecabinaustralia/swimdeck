require 'test_helper'

class GenericChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generic_checklist = generic_checklists(:one)
  end

  test "should get index" do
    get generic_checklists_url
    assert_response :success
  end

  test "should get new" do
    get new_generic_checklist_url
    assert_response :success
  end

  test "should create generic_checklist" do
    assert_difference('GenericChecklist.count') do
      post generic_checklists_url, params: { generic_checklist: { description: @generic_checklist.description, title: @generic_checklist.title } }
    end

    assert_redirected_to generic_checklist_url(GenericChecklist.last)
  end

  test "should show generic_checklist" do
    get generic_checklist_url(@generic_checklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_generic_checklist_url(@generic_checklist)
    assert_response :success
  end

  test "should update generic_checklist" do
    patch generic_checklist_url(@generic_checklist), params: { generic_checklist: { description: @generic_checklist.description, title: @generic_checklist.title } }
    assert_redirected_to generic_checklist_url(@generic_checklist)
  end

  test "should destroy generic_checklist" do
    assert_difference('GenericChecklist.count', -1) do
      delete generic_checklist_url(@generic_checklist)
    end

    assert_redirected_to generic_checklists_url
  end
end
