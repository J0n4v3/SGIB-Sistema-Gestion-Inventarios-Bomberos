class MantenimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_or_encargado

  def index
    @mantenimientos = Mantenimiento.includes(:producto, :user).order(created_at: :desc)
  end

  def new
    @mantenimiento = Mantenimiento.new
    @productos = Producto.all
  end

  def create
    @mantenimiento = Mantenimiento.new(mantenimiento_params)
    @mantenimiento.user = current_user

    if @mantenimiento.save
      redirect_to mantenimientos_path, notice: "Mantenimiento registrado correctamente."
    else
      @productos = Producto.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def mantenimiento_params
    params.require(:mantenimiento).permit(
      :producto_id, :tipo, :descripcion,
      :fecha_mantenimiento, :proximo_mantenimiento,
      :estado_post_mantenimiento
    )
  end

  def require_admin_or_encargado
    unless current_user.admin? || current_user.encargado?
      redirect_to root_path, alert: "No tienes permiso para registrar mantenimientos."
    end
  end
end
