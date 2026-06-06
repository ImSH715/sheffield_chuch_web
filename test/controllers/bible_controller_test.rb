require "test_helper"

class BibleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bible_index_url
    assert_response :success
  end
end
