require "test_helper"

class KategoriControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kategori_index_url
    assert_response :success
  end
end
