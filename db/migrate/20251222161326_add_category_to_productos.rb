class AddCategoryToProductos < ActiveRecord::Migration[7.2]
  def change
    # Permitimos NULL temporalmente
    add_reference :productos, :category, null: true, foreign_key: true
  end
end
