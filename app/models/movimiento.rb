class Movimiento < ApplicationRecord
  belongs_to :producto
  belongs_to :user
  validates :motivo_frecuente, presence: true
  validate :stock_suficiente, on: :create

  after_create :actualizar_stock

  private

  def stock_suficiente
    if tipo == "salida" && producto.cantidad < cantidad
      errors.add(:cantidad, "no puede ser mayor al stock disponible (#{producto.cantidad})")
    end
  end

  def actualizar_stock
    if tipo == "entrada"
      producto.increment!(:cantidad, cantidad)
    elsif tipo == "salida"
      producto.decrement!(:cantidad, cantidad)
    end
  end
end

