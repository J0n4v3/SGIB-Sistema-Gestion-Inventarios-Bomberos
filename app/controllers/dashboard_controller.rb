class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @productos_criticos = Producto.where("cantidad <= stock_minimo")
    @ultimos_movimientos = Movimiento.includes(:producto, :user)
                                     .order(created_at: :desc)
                                     .limit(5)
    @mantenimientos_pendientes = Mantenimiento.where(completado: false)
                                              .order(fecha_mantenimiento: :asc)
                                              .limit(5)
    @proximos_mantenimientos = Mantenimiento.where(completado: false)
                                            .where.not(proximo_mantenimiento: nil)
                                            .order(proximo_mantenimiento: :asc)
                                            .limit(5)
  end
end
