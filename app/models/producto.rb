class Producto < ApplicationRecord
  has_many :movimientos, dependent: :destroy
end
