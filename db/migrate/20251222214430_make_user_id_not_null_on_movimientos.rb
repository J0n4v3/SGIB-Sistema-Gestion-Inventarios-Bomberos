class MakeUserIdNotNullOnMovimientos < ActiveRecord::Migration[7.2]
  def change
    change_column_null :movimientos, :user_id, false
  end
end
