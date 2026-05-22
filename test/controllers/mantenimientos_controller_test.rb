require "test_helper"

class MantenimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mantenimiento = mantenimientos(:mantenimiento_extintor)
    @user = users(:encargado)
    sign_in @user
  end

  test "should get index" do
    get mantenimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_mantenimiento_url
    assert_response :success
  end

  test "should create mantenimiento" do
    assert_difference("Mantenimiento.count") do
      post mantenimientos_url, params: {
        mantenimiento: {
          producto_id: @mantenimiento.producto_id,
          tipo: "Preventivo",
          descripcion: "Revisión general",
          fecha_mantenimiento: Date.today,
          proximo_mantenimiento: Date.today + 180,
          estado_post_mantenimiento: "Operativo"
        }
      }
    end
    assert_redirected_to mantenimientos_url
  end
end
