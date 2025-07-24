class MovimientosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movimiento, only: %i[ show edit update destroy ]

  # GET /movimientos or /movimientos.json
  def index
    @movimientos = Movimiento.all
  end

  # GET /movimientos/1 or /movimientos/1.json
  def show
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
  def edit
  end

  # POST /movimientos or /movimientos.json
  def create
    @movimiento = Movimiento.new(movimiento_params)
    producto = @movimiento.producto

    # Validar si hay stock suficiente en caso de salida
    if @movimiento.tipo == 'salida' && producto.cantidad < @movimiento.cantidad
      flash.now[:alert] = "No hay suficiente stock para esta salida."
      return render :new, status: :unprocessable_entity
    end

    begin
      ActiveRecord::Base.transaction do
        @movimiento.save!
        #  Ya no actualizamos el stock acá
      end

      redirect_to movimientos_path, notice: "Movimiento creado correctamente."
    rescue => e
      flash.now[:alert] = "Error al guardar el movimiento: #{e.message}"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movimientos/1 or /movimientos/1.json
  def update
    respond_to do |format|
      if @movimiento.update(movimiento_params)
        format.html { redirect_to @movimiento, notice: "Movimiento was successfully updated." }
        format.json { render :show, status: :ok, location: @movimiento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movimiento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimientos/1 or /movimientos/1.json
  def destroy
    @movimiento.destroy!

    respond_to do |format|
      format.html { redirect_to movimientos_path, status: :see_other, notice: "Movimiento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_movimiento
      @movimiento = Movimiento.find(params[:id])
    end

    def movimiento_params
      params.require(:movimiento).permit(:producto_id, :tipo, :cantidad, :observacion)
    end
end
