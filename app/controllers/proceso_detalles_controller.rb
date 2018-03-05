class ProcesoDetallesController < ApplicationController
  load_and_authorize_resource
  before_action :set_proceso_detalle, only: [:show, :edit, :update, :destroy]

  # GET /proceso_detalles
  # GET /proceso_detalles.json
  def index
    @proceso_detalles = ProcesoDetalle.all
  end

  # GET /proceso_detalles/1
  # GET /proceso_detalles/1.json
  def show
  end

  # GET /proceso_detalles/new
  def new
    @proceso_detalle = ProcesoDetalle.new
  end

  # GET /proceso_detalles/1/edit
  def edit
  end

  # POST /proceso_detalles
  # POST /proceso_detalles.json
  def create
    @proceso_detalle = ProcesoDetalle.new(proceso_detalle_params)

    respond_to do |format|
      if @proceso_detalle.save
        format.html { redirect_to @proceso_detalle, notice: 'Proceso detalle was successfully created.' }
        format.json { render :show, status: :created, location: @proceso_detalle }
      else
        format.html { render :new }
        format.json { render json: @proceso_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proceso_detalles/1
  # PATCH/PUT /proceso_detalles/1.json
  def update
    respond_to do |format|
      if @proceso_detalle.update(proceso_detalle_params)
        format.html { redirect_to @proceso_detalle, notice: 'Proceso detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: @proceso_detalle }
      else
        format.html { render :edit }
        format.json { render json: @proceso_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proceso_detalles/1
  # DELETE /proceso_detalles/1.json
  def destroy
    @proceso_detalle.destroy
    respond_to do |format|
      format.html { redirect_to proceso_detalles_url, notice: 'Proceso detalle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso_detalle
      @proceso_detalle = ProcesoDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_detalle_params
      params.require(:proceso_detalle).permit(:numero, :lugar, :fecha_entrada, :fecha_salida)
    end
end
