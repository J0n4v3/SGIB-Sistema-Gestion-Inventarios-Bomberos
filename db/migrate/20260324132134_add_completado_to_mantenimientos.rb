class AddCompletadoToMantenimientos < ActiveRecord::Migration[7.2]
  def change
    add_column :mantenimientos, :completado, :boolean, default: false, null: false
  end
end
