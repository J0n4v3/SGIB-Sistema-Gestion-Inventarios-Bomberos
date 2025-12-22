class Mantenimiento < ApplicationRecord
  belongs_to :producto
  belongs_to :user

  validates :tipo, presence: true
  validates :fecha_mantenimiento, presence: true
end
