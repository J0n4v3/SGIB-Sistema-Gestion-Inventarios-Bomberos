class Producto < ApplicationRecord
  belongs_to :category
  has_many :movimientos
  validates :nombre, presence: true
  validates :cantidad, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_minimo, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  def bajo_stock?
    cantidad < stock_minimo
  end
end
