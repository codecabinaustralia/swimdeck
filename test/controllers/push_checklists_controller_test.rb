require 'test_helper'

class PushChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @push_checklist = push_checklists(:one)
  end

  test "should get index" do
    get push_checklists_url
    assert_response :success
  end

  test "should get new" do
    get new_push_checklist_url
    assert_response :success
  end

  test "should create push_checklist" do
    assert_difference('PushChecklist.count') do
      post push_checklists_url, params: { push_checklist: { completed: @push_checklist.completed, date_issued: @push_checklist.date_issued, description: @push_checklist.description, manager_id: @push_checklist.manager_id, site_id: @push_checklist.site_id, title: @push_checklist.title, user_id: @push_checklist.user_id } }
    end

    assert_redirected_to push_checklist_url(PushChecklist.last)
  end

  test "should show push_checklist" do
    get push_checklist_url(@push_checklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_push_checklist_url(@push_checklist)
    assert_response :success
  end

  test "should update push_checklist" do
    patch push_checklist_url(@push_checklist), params: { push_checklist: { completed: @push_checklist.completed, date_issued: @push_checklist.date_issued, description: @push_checklist.description, manager_id: @push_checklist.manager_id, site_id: @push_checklist.site_id, title: @push_checklist.title, user_id: @push_checklist.user_id } }
    assert_redirected_to push_checklist_url(@push_checklist)
  end

  test "should destroy push_checklist" do
    assert_difference('PushChecklist.count', -1) do
      delete push_checklist_url(@push_checklist)
    end

    assert_redirected_to push_checklists_url
  end
end
