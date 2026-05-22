class UsuariosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_usuario, only: [:update]

  def index
    @usuarios = User.all.order(:username)
    @usuario ||= User.new
  end

  def new
    @usuario = User.new
  end

  def create
    @usuario = User.new(new_user_params)
    if @usuario.save
      redirect_to usuarios_path, notice: "Usuario creado correctamente."
    else
      @usuarios = User.all.order(:username)
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @usuario.update(update_user_params)
      redirect_to usuarios_path, notice: "Usuario actualizado correctamente."
    else
      @usuarios = User.all.order(:username)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_usuario
    @usuario = User.find(params[:id])
  end

  def new_user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end

  def update_user_params
    params.require(:user).permit(:role)
  end
end
