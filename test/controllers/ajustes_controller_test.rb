require "test_helper"

class AjustesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ajuste = ajustes(:ajuste_casco)
    @user = users(:encargado)
    sign_in @user
  end

  test "should get index" do
    get ajustes_url
    assert_response :success
  end

  test "should get new" do
    get new_ajuste_url
    assert_response :success
  end

  test "should create ajuste" do
    assert_difference("Ajuste.count") do
      post ajustes_url, params: {
        ajuste: {
          producto_id: @ajuste.producto_id,
          cantidad_nueva: 12,
          motivo: "Conteo físico actualizado"
        }
      }
    end
    assert_redirected_to ajustes_url
  end
end
