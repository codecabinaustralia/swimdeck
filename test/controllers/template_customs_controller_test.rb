require 'test_helper'

class TemplateCustomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template_custom = template_customs(:one)
  end

  test "should get index" do
    get template_customs_url
    assert_response :success
  end

  test "should get new" do
    get new_template_custom_url
    assert_response :success
  end

  test "should create template_custom" do
    assert_difference('TemplateCustom.count') do
      post template_customs_url, params: { template_custom: { about_1_img1: @template_custom.about_1_img1, about_1_img2: @template_custom.about_1_img2, about_1_primarytxt: @template_custom.about_1_primarytxt, about_1_subtxt: @template_custom.about_1_subtxt, about_1_txt: @template_custom.about_1_txt, content_6col_leftimg1: @template_custom.content_6col_leftimg1, content_6col_leftimg2: @template_custom.content_6col_leftimg2, content_6col_leftprimarytxt: @template_custom.content_6col_leftprimarytxt, content_6col_leftsubtxt: @template_custom.content_6col_leftsubtxt, content_6col_lefttxt: @template_custom.content_6col_lefttxt, content_6col_rightimg1: @template_custom.content_6col_rightimg1, content_6col_rightimg2: @template_custom.content_6col_rightimg2, content_6col_rightprimarytxt: @template_custom.content_6col_rightprimarytxt, content_6col_rightsubtxt: @template_custom.content_6col_rightsubtxt, content_6col_righttxt: @template_custom.content_6col_righttxt, header_1_btntxt: @template_custom.header_1_btntxt, header_1_img: @template_custom.header_1_img, header_1_overlay_color: @template_custom.header_1_overlay_color, header_1_primarytxt: @template_custom.header_1_primarytxt, header_1_subtxt: @template_custom.header_1_subtxt, quote_bar_btntxt: @template_custom.quote_bar_btntxt, quote_bar_primarytxt: @template_custom.quote_bar_primarytxt, quotebar_1_subtxt: @template_custom.quotebar_1_subtxt, quotebox_1_btntxt: @template_custom.quotebox_1_btntxt, quotebox_1_primarytxt: @template_custom.quotebox_1_primarytxt, quotebox_1_subtxt: @template_custom.quotebox_1_subtxt, services_1_primarytxt: @template_custom.services_1_primarytxt } }
    end

    assert_redirected_to template_custom_url(TemplateCustom.last)
  end

  test "should show template_custom" do
    get template_custom_url(@template_custom)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_custom_url(@template_custom)
    assert_response :success
  end

  test "should update template_custom" do
    patch template_custom_url(@template_custom), params: { template_custom: { about_1_img1: @template_custom.about_1_img1, about_1_img2: @template_custom.about_1_img2, about_1_primarytxt: @template_custom.about_1_primarytxt, about_1_subtxt: @template_custom.about_1_subtxt, about_1_txt: @template_custom.about_1_txt, content_6col_leftimg1: @template_custom.content_6col_leftimg1, content_6col_leftimg2: @template_custom.content_6col_leftimg2, content_6col_leftprimarytxt: @template_custom.content_6col_leftprimarytxt, content_6col_leftsubtxt: @template_custom.content_6col_leftsubtxt, content_6col_lefttxt: @template_custom.content_6col_lefttxt, content_6col_rightimg1: @template_custom.content_6col_rightimg1, content_6col_rightimg2: @template_custom.content_6col_rightimg2, content_6col_rightprimarytxt: @template_custom.content_6col_rightprimarytxt, content_6col_rightsubtxt: @template_custom.content_6col_rightsubtxt, content_6col_righttxt: @template_custom.content_6col_righttxt, header_1_btntxt: @template_custom.header_1_btntxt, header_1_img: @template_custom.header_1_img, header_1_overlay_color: @template_custom.header_1_overlay_color, header_1_primarytxt: @template_custom.header_1_primarytxt, header_1_subtxt: @template_custom.header_1_subtxt, quote_bar_btntxt: @template_custom.quote_bar_btntxt, quote_bar_primarytxt: @template_custom.quote_bar_primarytxt, quotebar_1_subtxt: @template_custom.quotebar_1_subtxt, quotebox_1_btntxt: @template_custom.quotebox_1_btntxt, quotebox_1_primarytxt: @template_custom.quotebox_1_primarytxt, quotebox_1_subtxt: @template_custom.quotebox_1_subtxt, services_1_primarytxt: @template_custom.services_1_primarytxt } }
    assert_redirected_to template_custom_url(@template_custom)
  end

  test "should destroy template_custom" do
    assert_difference('TemplateCustom.count', -1) do
      delete template_custom_url(@template_custom)
    end

    assert_redirected_to template_customs_url
  end
end
