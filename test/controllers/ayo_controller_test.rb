require "test_helper"

class AyoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ayo_index_url
    assert_response :success
  end
end
