class User < ApplicationRecord
  # Devise modules para autenticación
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum moderno (Rails 7.2)
  enum :role, { bombero: 0, encargado: 1, admin: 2 }

  # Asignar rol por defecto
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :bombero
  end
end
