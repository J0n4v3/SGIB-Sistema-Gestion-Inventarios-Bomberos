class AddCierreFieldsToMantenimientos < ActiveRecord::Migration[7.2]
  def change
    add_column :mantenimientos, :condicion_equipo, :string
    add_column :mantenimientos, :observacion_cierre, :text
  end
end
