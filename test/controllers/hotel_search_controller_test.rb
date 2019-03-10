require 'test_helper'

class HotelSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get hotel_search_home_url
    assert_response :success
  end

end
