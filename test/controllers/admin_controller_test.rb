require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get Tagserches" do
    get admin_Tagserches_url
    assert_response :success
  end

  test "should get search" do
    get admin_search_url
    assert_response :success
  end
end
