require "test_helper"

class Public::TagserchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get public_tagserches_search_url
    assert_response :success
  end
end
