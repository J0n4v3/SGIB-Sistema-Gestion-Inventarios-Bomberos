class RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to new_user_session_path, alert: "Registro deshabilitado."
  end

  def create
    redirect_to new_user_session_path, alert: "Registro deshabilitado."
  end
end
