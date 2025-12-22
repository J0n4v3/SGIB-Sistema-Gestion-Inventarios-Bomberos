class ApplicationController < ActionController::Base
  # Cargar los helpers de Devise (necesario para resource, resource_name, devise_mapping, etc)
  include Devise::Controllers::Helpers
  helper Devise::Controllers::Helpers

  # Lógica tuya (la dejo tal cual está ahora)
  before_action :set_productos_bajo_stock

  private

  def set_productos_bajo_stock
    @productos_bajo_stock = Producto.where('cantidad < stock_minimo')
  end
end
