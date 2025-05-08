class CreateMovements < ActiveRecord::Migration[7.2]
  def change
    create_table :movements do |t|
      t.string :movement_type
      t.datetime :datetime
      t.integer :quantity
      t.text :reason
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
