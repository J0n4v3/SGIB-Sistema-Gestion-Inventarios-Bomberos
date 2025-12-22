require "test_helper"

class MantenimientosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mantenimientos_index_url
    assert_response :success
  end

  test "should get new" do
    get mantenimientos_new_url
    assert_response :success
  end

  test "should get create" do
    get mantenimientos_create_url
    assert_response :success
  end
end
