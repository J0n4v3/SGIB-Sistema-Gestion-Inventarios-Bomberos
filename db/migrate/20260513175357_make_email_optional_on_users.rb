class MakeEmailOptionalOnUsers < ActiveRecord::Migration[7.1]
  def change
    # Quita la restricción de que no puede ser nulo
    change_column_null :users, :email, true
    # Quita el índice único del email para que no de problemas si hay varios usuarios sin email
    remove_index :users, :email if index_exists?(:users, :email)
  end
end