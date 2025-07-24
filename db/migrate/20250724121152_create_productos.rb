class CreateProductos < ActiveRecord::Migration[7.2]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :categoria
      t.integer :cantidad
      t.string :unidad

      t.timestamps
    end
  end
end
