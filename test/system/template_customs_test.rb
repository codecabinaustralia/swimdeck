require "application_system_test_case"

class TemplateCustomsTest < ApplicationSystemTestCase
  setup do
    @template_custom = template_customs(:one)
  end

  test "visiting the index" do
    visit template_customs_url
    assert_selector "h1", text: "Template Customs"
  end

  test "creating a Template custom" do
    visit template_customs_url
    click_on "New Template Custom"

    fill_in "About 1 Img1", with: @template_custom.about_1_img1
    fill_in "About 1 Img2", with: @template_custom.about_1_img2
    fill_in "About 1 Primarytxt", with: @template_custom.about_1_primarytxt
    fill_in "About 1 Subtxt", with: @template_custom.about_1_subtxt
    fill_in "About 1 Txt", with: @template_custom.about_1_txt
    fill_in "Content 6col Leftimg1", with: @template_custom.content_6col_leftimg1
    fill_in "Content 6col Leftimg2", with: @template_custom.content_6col_leftimg2
    fill_in "Content 6col Leftprimarytxt", with: @template_custom.content_6col_leftprimarytxt
    fill_in "Content 6col Leftsubtxt", with: @template_custom.content_6col_leftsubtxt
    fill_in "Content 6col Lefttxt", with: @template_custom.content_6col_lefttxt
    fill_in "Content 6col Rightimg1", with: @template_custom.content_6col_rightimg1
    fill_in "Content 6col Rightimg2", with: @template_custom.content_6col_rightimg2
    fill_in "Content 6col Rightprimarytxt", with: @template_custom.content_6col_rightprimarytxt
    fill_in "Content 6col Rightsubtxt", with: @template_custom.content_6col_rightsubtxt
    fill_in "Content 6col Righttxt", with: @template_custom.content_6col_righttxt
    fill_in "Header 1 Btntxt", with: @template_custom.header_1_btntxt
    fill_in "Header 1 Img", with: @template_custom.header_1_img
    fill_in "Header 1 Overlay Color", with: @template_custom.header_1_overlay_color
    fill_in "Header 1 Primarytxt", with: @template_custom.header_1_primarytxt
    fill_in "Header 1 Subtxt", with: @template_custom.header_1_subtxt
    fill_in "Quote Bar Btntxt", with: @template_custom.quote_bar_btntxt
    fill_in "Quote Bar Primarytxt", with: @template_custom.quote_bar_primarytxt
    fill_in "Quotebar 1 Subtxt", with: @template_custom.quotebar_1_subtxt
    fill_in "Quotebox 1 Btntxt", with: @template_custom.quotebox_1_btntxt
    fill_in "Quotebox 1 Primarytxt", with: @template_custom.quotebox_1_primarytxt
    fill_in "Quotebox 1 Subtxt", with: @template_custom.quotebox_1_subtxt
    fill_in "Services 1 Primarytxt", with: @template_custom.services_1_primarytxt
    click_on "Create Template custom"

    assert_text "Template custom was successfully created"
    click_on "Back"
  end

  test "updating a Template custom" do
    visit template_customs_url
    click_on "Edit", match: :first

    fill_in "About 1 Img1", with: @template_custom.about_1_img1
    fill_in "About 1 Img2", with: @template_custom.about_1_img2
    fill_in "About 1 Primarytxt", with: @template_custom.about_1_primarytxt
    fill_in "About 1 Subtxt", with: @template_custom.about_1_subtxt
    fill_in "About 1 Txt", with: @template_custom.about_1_txt
    fill_in "Content 6col Leftimg1", with: @template_custom.content_6col_leftimg1
    fill_in "Content 6col Leftimg2", with: @template_custom.content_6col_leftimg2
    fill_in "Content 6col Leftprimarytxt", with: @template_custom.content_6col_leftprimarytxt
    fill_in "Content 6col Leftsubtxt", with: @template_custom.content_6col_leftsubtxt
    fill_in "Content 6col Lefttxt", with: @template_custom.content_6col_lefttxt
    fill_in "Content 6col Rightimg1", with: @template_custom.content_6col_rightimg1
    fill_in "Content 6col Rightimg2", with: @template_custom.content_6col_rightimg2
    fill_in "Content 6col Rightprimarytxt", with: @template_custom.content_6col_rightprimarytxt
    fill_in "Content 6col Rightsubtxt", with: @template_custom.content_6col_rightsubtxt
    fill_in "Content 6col Righttxt", with: @template_custom.content_6col_righttxt
    fill_in "Header 1 Btntxt", with: @template_custom.header_1_btntxt
    fill_in "Header 1 Img", with: @template_custom.header_1_img
    fill_in "Header 1 Overlay Color", with: @template_custom.header_1_overlay_color
    fill_in "Header 1 Primarytxt", with: @template_custom.header_1_primarytxt
    fill_in "Header 1 Subtxt", with: @template_custom.header_1_subtxt
    fill_in "Quote Bar Btntxt", with: @template_custom.quote_bar_btntxt
    fill_in "Quote Bar Primarytxt", with: @template_custom.quote_bar_primarytxt
    fill_in "Quotebar 1 Subtxt", with: @template_custom.quotebar_1_subtxt
    fill_in "Quotebox 1 Btntxt", with: @template_custom.quotebox_1_btntxt
    fill_in "Quotebox 1 Primarytxt", with: @template_custom.quotebox_1_primarytxt
    fill_in "Quotebox 1 Subtxt", with: @template_custom.quotebox_1_subtxt
    fill_in "Services 1 Primarytxt", with: @template_custom.services_1_primarytxt
    click_on "Update Template custom"

    assert_text "Template custom was successfully updated"
    click_on "Back"
  end

  test "destroying a Template custom" do
    visit template_customs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Template custom was successfully destroyed"
  end
end
