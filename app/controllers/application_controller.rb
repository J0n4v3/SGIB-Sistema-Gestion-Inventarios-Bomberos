class ApplicationController < ActionController::Base
  layout "tailwind"
  # Cargar los helpers de Devise 
  include Devise::Controllers::Helpers
  helper Devise::Controllers::Helpers

  
  before_action :set_productos_bajo_stock

  private

  def set_productos_bajo_stock
    @productos_bajo_stock = Producto.where('cantidad < stock_minimo')
  end

  def require_admin
    unless current_user&.administrador?
      redirect_to root_path, alert: "Acceso denegado. Se requieren permisos de administrador."
    end
  end

  def require_encargado_or_admin
    unless current_user&.administrador? || current_user&.encargado?
      redirect_to root_path, alert: "Acceso denegado. Se requieren permisos de encargado o administrador."
    end
  end
end
