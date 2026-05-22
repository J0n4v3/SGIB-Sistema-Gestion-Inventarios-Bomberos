require "test_helper"

class MovimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimiento = movimientos(:entrada_casco)
    @user = users(:encargado)
    sign_in @user
  end

  test "should get index" do
    get movimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_movimiento_url
    assert_response :success
  end

  test "should create movimiento" do
    assert_difference("Movimiento.count") do
      post movimientos_url, params: {
        movimiento: {
          cantidad: 3,
          observacion: "Test entrada",
          producto_id: @movimiento.producto_id,
          tipo: "Entrada",
          motivo_frecuente: "reposicion"
        }
      }
    end
    assert_redirected_to movimientos_url
  end

  test "should show movimiento" do
    get movimiento_url(@movimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimiento_url(@movimiento)
    assert_response :success
  end

  test "should update movimiento" do
    patch movimiento_url(@movimiento), params: {
      movimiento: {
        cantidad: @movimiento.cantidad,
        observacion: "Observacion actualizada",
        producto_id: @movimiento.producto_id,
        tipo: @movimiento.tipo
      }
    }
    assert_redirected_to movimiento_url(@movimiento)
  end

  test "should destroy movimiento" do
    assert_difference("Movimiento.count", -1) do
      delete movimiento_url(@movimiento)
    end
    assert_redirected_to movimientos_url
  end
end
