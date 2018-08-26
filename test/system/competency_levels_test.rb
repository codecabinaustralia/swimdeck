require "application_system_test_case"

class CompetencyLevelsTest < ApplicationSystemTestCase
  setup do
    @competency_level = competency_levels(:one)
  end

  test "visiting the index" do
    visit competency_levels_url
    assert_selector "h1", text: "Competency Levels"
  end

  test "creating a Competency level" do
    visit competency_levels_url
    click_on "New Competency Level"

    fill_in "Title", with: @competency_level.title
    click_on "Create Competency level"

    assert_text "Competency level was successfully created"
    click_on "Back"
  end

  test "updating a Competency level" do
    visit competency_levels_url
    click_on "Edit", match: :first

    fill_in "Title", with: @competency_level.title
    click_on "Update Competency level"

    assert_text "Competency level was successfully updated"
    click_on "Back"
  end

  test "destroying a Competency level" do
    visit competency_levels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Competency level was successfully destroyed"
  end
end
