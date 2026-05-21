class RemoveCategoriaFromProductos < ActiveRecord::Migration[7.2]
  def change
    remove_column :productos, :categoria, :string
  end
end
