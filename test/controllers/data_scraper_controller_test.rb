require 'test_helper'

class DataScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get csv_spider" do
    get data_scraper_csv_spider_url
    assert_response :success
  end

end
