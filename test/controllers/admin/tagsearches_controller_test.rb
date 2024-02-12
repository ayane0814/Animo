require "test_helper"

class Admin::TagsearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get admin_tagsearches_search_url
    assert_response :success
  end
end
