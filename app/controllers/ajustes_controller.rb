class AjustesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin_or_encargado

  def index
    @ajustes = Ajuste.includes(:producto, :user).order(created_at: :desc)
  end

  def new
    @ajuste = Ajuste.new
    @productos = Producto.all
  end

  def create
    @ajuste = Ajuste.new(ajuste_params)
    producto = @ajuste.producto
    @ajuste.cantidad_anterior = producto.cantidad
    @ajuste.user = current_user

    if @ajuste.save
      producto.update!(cantidad: @ajuste.cantidad_nueva)
      redirect_to ajustes_path, notice: "Ajuste aplicado correctamente."
    else
      @productos = Producto.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ajuste_params
    params.require(:ajuste).permit(:producto_id, :cantidad_nueva, :motivo)
  end

  def require_admin_or_encargado
    unless current_user.admin? || current_user.encargado?
      redirect_to root_path, alert: "No tienes permiso para realizar ajustes."
    end
  end
end
