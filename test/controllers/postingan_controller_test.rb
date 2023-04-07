require "test_helper"

class PostinganControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postingan_index_url
    assert_response :success
  end
end
