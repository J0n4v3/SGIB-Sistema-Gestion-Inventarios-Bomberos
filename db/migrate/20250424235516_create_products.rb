class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.string :unit
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
