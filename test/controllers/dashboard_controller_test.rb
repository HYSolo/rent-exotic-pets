require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get pets" do
    get dashboard_pets_url
    assert_response :success
  end

  test "should get bookings" do
    get dashboard_bookings_url
    assert_response :success
  end

end
