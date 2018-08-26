require "application_system_test_case"

class GenericChecklistsTest < ApplicationSystemTestCase
  setup do
    @generic_checklist = generic_checklists(:one)
  end

  test "visiting the index" do
    visit generic_checklists_url
    assert_selector "h1", text: "Generic Checklists"
  end

  test "creating a Generic checklist" do
    visit generic_checklists_url
    click_on "New Generic Checklist"

    fill_in "Description", with: @generic_checklist.description
    fill_in "Title", with: @generic_checklist.title
    click_on "Create Generic checklist"

    assert_text "Generic checklist was successfully created"
    click_on "Back"
  end

  test "updating a Generic checklist" do
    visit generic_checklists_url
    click_on "Edit", match: :first

    fill_in "Description", with: @generic_checklist.description
    fill_in "Title", with: @generic_checklist.title
    click_on "Update Generic checklist"

    assert_text "Generic checklist was successfully updated"
    click_on "Back"
  end

  test "destroying a Generic checklist" do
    visit generic_checklists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Generic checklist was successfully destroyed"
  end
end
