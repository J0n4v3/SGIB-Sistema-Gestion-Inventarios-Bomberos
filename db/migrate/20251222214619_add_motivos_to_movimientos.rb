class AddMotivosToMovimientos < ActiveRecord::Migration[7.2]
  def change
    add_column :movimientos, :motivo_frecuente, :string
    add_column :movimientos, :otro_motivo, :text
  end
end
