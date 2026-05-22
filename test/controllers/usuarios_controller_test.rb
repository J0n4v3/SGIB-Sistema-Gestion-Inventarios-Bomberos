require "test_helper"

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
    @bombero = users(:bombero)
    sign_in @user
  end

  test "should get index" do
    get usuarios_url
    assert_response :success
  end

  test "should update user role" do
    patch usuario_url(@bombero), params: { user: { role: "supervisor" } }
    assert_redirected_to usuarios_url
    assert_equal "supervisor", @bombero.reload.role
  end
end
