require "application_system_test_case"

class LessonsTest < ApplicationSystemTestCase
  setup do
    @lesson = lessons(:one)
  end

  test "visiting the index" do
    visit lessons_url
    assert_selector "h1", text: "Lessons"
  end

  test "creating a Lesson" do
    visit lessons_url
    click_on "New Lesson"

    fill_in "Finish Time", with: @lesson.finish_time
    fill_in "Site", with: @lesson.site_id
    fill_in "Start Time", with: @lesson.start_time
    fill_in "User", with: @lesson.user_id
    click_on "Create Lesson"

    assert_text "Lesson was successfully created"
    click_on "Back"
  end

  test "updating a Lesson" do
    visit lessons_url
    click_on "Edit", match: :first

    fill_in "Finish Time", with: @lesson.finish_time
    fill_in "Site", with: @lesson.site_id
    fill_in "Start Time", with: @lesson.start_time
    fill_in "User", with: @lesson.user_id
    click_on "Update Lesson"

    assert_text "Lesson was successfully updated"
    click_on "Back"
  end

  test "destroying a Lesson" do
    visit lessons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lesson was successfully destroyed"
  end
end
