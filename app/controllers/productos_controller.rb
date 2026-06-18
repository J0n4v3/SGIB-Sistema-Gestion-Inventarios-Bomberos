class ProductosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_encargado_or_admin, except: %i[index show]
  before_action :set_producto, only: %i[ show edit update destroy ]

  def index
  @productos = if params[:search].present?
    Producto.joins(:category)
            .where("productos.nombre ILIKE ? OR categories.nombre ILIKE ?", 
                   "%#{params[:search]}%", 
                   "%#{params[:search]}%")
  else
    Producto.all
  end
end

  def show
  end

  def new
    @producto = Producto.new
  end

  def edit
  end

  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: "Producto creado correctamente." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: "Producto actualizado correctamente." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  if @producto.movimientos.any?
    redirect_to productos_path, alert: "No se puede eliminar un producto con movimientos registrados."
  else
    @producto.destroy
    redirect_to productos_path, notice: "Producto eliminado correctamente."
  end
end

  private
    # Callback para buscar el producto
      @producto = Producto.find(params[:id])
    end

    # Filtra y permite atributos especificados
    def producto_params
  params.require(:producto).permit(:nombre, :category_id, :cantidad, :unidad, :stock_minimo)
end
end
