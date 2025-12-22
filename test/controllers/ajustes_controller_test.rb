require "test_helper"

class AjustesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ajustes_index_url
    assert_response :success
  end

  test "should get new" do
    get ajustes_new_url
    assert_response :success
  end
end
