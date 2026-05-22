require "test_helper"

class ProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producto = productos(:casco)
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    get productos_url
    assert_response :success
  end

  test "should get new" do
    get new_producto_url
    assert_response :success
  end

  test "should create producto" do
    assert_difference("Producto.count") do
      post productos_url, params: {
        producto: {
          nombre: "Guantes de Rescate",
          cantidad: 8,
          unidad: "par",
          stock_minimo: 2,
          category_id: @producto.category_id
        }
      }
    end
    assert_redirected_to producto_url(Producto.last)
  end

  test "should show producto" do
    get producto_url(@producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_producto_url(@producto)
    assert_response :success
  end

  test "should update producto" do
    patch producto_url(@producto), params: {
      producto: {
        nombre: @producto.nombre,
        cantidad: @producto.cantidad,
        unidad: @producto.unidad,
        stock_minimo: 5,
        category_id: @producto.category_id
      }
    }
    assert_redirected_to producto_url(@producto)
  end

  test "should destroy producto" do
    # Crear un producto sin movimientos ni ajustes para poder eliminarlo
    prod = Producto.create!(
      nombre: "Producto Temporal",
      cantidad: 1,
      unidad: "unidad",
      stock_minimo: 0,
      category: categories(:equipos_proteccion)
    )
    assert_difference("Producto.count", -1) do
      delete producto_url(prod)
    end
    assert_redirected_to productos_url
  end
end
