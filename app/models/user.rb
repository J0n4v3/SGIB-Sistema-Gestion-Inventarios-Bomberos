class User < ApplicationRecord
  # Agrega 'authentication_keys' para decirle que use el username
  devise :database_authenticatable, :rememberable, :validatable, authentication_keys: [:username]

enum :role, { bombero: 0, encargado: 1, administrador: 2 }
  after_initialize :set_default_role, if: :new_record?

  # VALIDACIONES
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  # Le dice a Devise que el email NO es necesario para validar
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  # Login por username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (username = conditions.delete(:username))
      where(conditions.to_h).where("lower(username) = ?", username.downcase).first
    else
      where(conditions.to_h).first
    end
  end

  private

  def set_default_role
    self.role ||= :bombero
  end
end