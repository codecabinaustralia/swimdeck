require "application_system_test_case"

class PushChecklistsTest < ApplicationSystemTestCase
  setup do
    @push_checklist = push_checklists(:one)
  end

  test "visiting the index" do
    visit push_checklists_url
    assert_selector "h1", text: "Push Checklists"
  end

  test "creating a Push checklist" do
    visit push_checklists_url
    click_on "New Push Checklist"

    fill_in "Completed", with: @push_checklist.completed
    fill_in "Date Issued", with: @push_checklist.date_issued
    fill_in "Description", with: @push_checklist.description
    fill_in "Manager", with: @push_checklist.manager_id
    fill_in "Site", with: @push_checklist.site_id
    fill_in "Title", with: @push_checklist.title
    fill_in "User", with: @push_checklist.user_id
    click_on "Create Push checklist"

    assert_text "Push checklist was successfully created"
    click_on "Back"
  end

  test "updating a Push checklist" do
    visit push_checklists_url
    click_on "Edit", match: :first

    fill_in "Completed", with: @push_checklist.completed
    fill_in "Date Issued", with: @push_checklist.date_issued
    fill_in "Description", with: @push_checklist.description
    fill_in "Manager", with: @push_checklist.manager_id
    fill_in "Site", with: @push_checklist.site_id
    fill_in "Title", with: @push_checklist.title
    fill_in "User", with: @push_checklist.user_id
    click_on "Update Push checklist"

    assert_text "Push checklist was successfully updated"
    click_on "Back"
  end

  test "destroying a Push checklist" do
    visit push_checklists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Push checklist was successfully destroyed"
  end
end
