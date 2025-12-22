class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :verificar_admin!

  def index
    @usuarios = User.all
  end

  def update
    @usuario = User.find(params[:id])
    if @usuario.update(user_params)
      redirect_to usuarios_path, notice: "Rol actualizado correctamente."
    else
      redirect_to usuarios_path, alert: "No se pudo actualizar el rol."
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def verificar_admin!
    redirect_to root_path, alert: "No autorizado" unless current_user.admin?
  end
end
