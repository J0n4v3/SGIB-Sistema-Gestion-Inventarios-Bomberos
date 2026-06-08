class MovimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :require_encargado_or_admin, except: %i[index show new create]
  before_action :set_movimiento, only: %i[show edit update destroy]

  # GET /movimientos
  def index
    @movimientos = Movimiento.includes(:producto, :user).order(created_at: :desc)
  end

  # GET /movimientos/1
  def show
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
***REMOVED***
  def edit
  end

  # POST /movimientos
  def create
    @movimiento = Movimiento.new(movimiento_params)
    @movimiento.user = current_user # responsable automático

    producto = @movimiento.producto

    # Validación extra de stock
    if @movimiento.tipo == "salida" && producto.cantidad < @movimiento.cantidad
      flash.now[:alert] = "No hay suficiente stock para esta salida."
      return render :new, status: :unprocessable_entity
    end

    if @movimiento.save
      redirect_to movimientos_path, notice: "Movimiento registrado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movimientos/1
  def update
    if @movimiento.update(movimiento_params)
      redirect_to @movimiento, notice: "Movimiento actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /movimientos/1
  def destroy
    @movimiento.destroy
    redirect_to movimientos_path, notice: "Movimiento eliminado correctamente."
  end

  private

  def set_movimiento
    @movimiento = Movimiento.find(params[:id])
  end

  def movimiento_params
    params.require(:movimiento).permit(
      :producto_id,
      :tipo,
      :cantidad,
      :motivo_frecuente,
      :otro_motivo,
      :observacion
    )
  end
end
