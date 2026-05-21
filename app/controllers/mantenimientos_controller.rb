class MantenimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_supervisor_or_admin, except: %i[index]
  before_action :set_mantenimiento, only: [ :completar ]

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

def completar
  if @mantenimiento.update(completado: !@mantenimiento.completado)
    redirect_to mantenimientos_path, notice: "Estado actualizado correctamente."
  else
    redirect_to mantenimientos_path, alert: "No se pudo actualizar."
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



  def set_mantenimiento
    @mantenimiento = Mantenimiento.find(params[:id])
  end
end
