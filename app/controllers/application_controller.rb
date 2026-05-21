class ApplicationController < ActionController::Base
  layout "tailwind"
  # Cargar los helpers de Devise (necesario para resource, resource_name, devise_mapping, etc)
  include Devise::Controllers::Helpers
  helper Devise::Controllers::Helpers

  # Lógica tuya (la dejo tal cual está ahora)
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

  def require_supervisor_or_admin
    unless current_user&.administrador? || current_user&.supervisor?
      redirect_to root_path, alert: "Acceso denegado. Se requieren permisos de supervisor o administrador."
    end
  end
end
