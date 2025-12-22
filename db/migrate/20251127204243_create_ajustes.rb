class CreateAjustes < ActiveRecord::Migration[7.2]
  def change
    create_table :ajustes do |t|
      t.references :producto, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :cantidad_anterior
      t.integer :cantidad_nueva
      t.string :motivo

      t.timestamps
    end
  end
end
