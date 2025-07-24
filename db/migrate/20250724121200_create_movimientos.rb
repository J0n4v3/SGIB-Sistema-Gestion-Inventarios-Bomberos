class CreateMovimientos < ActiveRecord::Migration[7.2]
  def change
    create_table :movimientos do |t|
      t.references :producto, null: false, foreign_key: true
      t.string :tipo
      t.integer :cantidad
      t.string :observacion

      t.timestamps
    end
  end
end
