require "application_system_test_case"

class MovimientosTest < ApplicationSystemTestCase
  setup do
    @movimiento = movimientos(:one)
  end

  test "visiting the index" do
    visit movimientos_url
    assert_selector "h1", text: "Movimientos"
  end

  test "should create movimiento" do
    visit movimientos_url
    click_on "New movimiento"

    fill_in "Cantidad", with: @movimiento.cantidad
    fill_in "Observacion", with: @movimiento.observacion
    fill_in "Producto", with: @movimiento.producto_id
    fill_in "Tipo", with: @movimiento.tipo
    click_on "Create Movimiento"

    assert_text "Movimiento was successfully created"
    click_on "Back"
  end

  test "should update Movimiento" do
    visit movimiento_url(@movimiento)
    click_on "Edit this movimiento", match: :first

    fill_in "Cantidad", with: @movimiento.cantidad
    fill_in "Observacion", with: @movimiento.observacion
    fill_in "Producto", with: @movimiento.producto_id
    fill_in "Tipo", with: @movimiento.tipo
    click_on "Update Movimiento"

    assert_text "Movimiento was successfully updated"
    click_on "Back"
  end

  test "should destroy Movimiento" do
    visit movimiento_url(@movimiento)
    click_on "Destroy this movimiento", match: :first

    assert_text "Movimiento was successfully destroyed"
  end
end
