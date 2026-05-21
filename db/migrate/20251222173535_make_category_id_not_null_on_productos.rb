class MakeCategoryIdNotNullOnProductos < ActiveRecord::Migration[7.2]
  def change
    change_column_null :productos, :category_id, false
  end
end
