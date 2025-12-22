class Ajuste < ApplicationRecord
  belongs_to :producto
  belongs_to :user

  validates :cantidad_nueva, presence: true
  validates :motivo, presence: true
end
