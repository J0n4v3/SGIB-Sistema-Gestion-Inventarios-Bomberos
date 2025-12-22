class Producto < ApplicationRecord
  validates :nombre, presence: true
  validates :cantidad, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_minimo, numericality: { greater_than_or_equal_to: 0 }

  # Método para alertas
  def bajo_stock?
    cantidad < stock_minimo
  end
end
