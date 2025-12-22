class ApplicationController < ActionController::Base
  # Cargar los helpers de Devise
  include Devise::Controllers::Helpers
  helper Devise::Controllers::Helpers

***REMOVED***
  before_action :set_productos_bajo_stock

  private

  def set_productos_bajo_stock
    @productos_bajo_stock = Producto.where('cantidad < stock_minimo')
  end
end
