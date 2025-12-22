class CreateMantenimientos < ActiveRecord::Migration[7.2]
  def change
    create_table :mantenimientos do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tipo
      t.text :descripcion
      t.date :fecha_mantenimiento
      t.date :proximo_mantenimiento
      t.string :estado_post_mantenimiento

      t.timestamps
    end
  end
end
