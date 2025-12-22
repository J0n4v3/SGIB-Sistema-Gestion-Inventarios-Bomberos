class AddStockMinimoToProductos < ActiveRecord::Migration[7.2]
  def change
    add_column :productos, :stock_minimo, :integer, default: 0, null: false
  end
end
