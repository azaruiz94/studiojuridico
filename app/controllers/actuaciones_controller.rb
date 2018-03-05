class ActuacionesController < ApplicationController
  load_and_authorize_resource
  before_action :set_actuacion, only: [:show, :edit, :update, :destroy]

  # GET /actuaciones
  # GET /actuaciones.json
  def index
    @actuaciones = Actuacion.all
  end

  # GET /actuaciones/1
  # GET /actuaciones/1.json
  def show
  end

  # GET /actuaciones/new
  def new
    @actuacion = Actuacion.new
  end

  # GET /actuaciones/1/edit
  def edit
  end

  # POST /actuaciones
  # POST /actuaciones.json
  def create
    @actuacion = Actuacion.new(actuacion_params)

    respond_to do |format|
      if @actuacion.save
        format.html { redirect_to @actuacion, notice: 'Actuacion was successfully created.' }
        format.json { render :show, status: :created, location: @actuacion }
      else
        format.html { render :new }
        format.json { render json: @actuacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actuaciones/1
  # PATCH/PUT /actuaciones/1.json
  def update
    respond_to do |format|
      if @actuacion.update(actuacion_params)
        format.html { redirect_to @actuacion, notice: 'Actuacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @actuacion }
      else
        format.html { render :edit }
        format.json { render json: @actuacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actuaciones/1
  # DELETE /actuaciones/1.json
  def destroy
    @actuacion.destroy
    respond_to do |format|
      format.html { redirect_to actuaciones_url, notice: 'Actuacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actuacion
      @actuacion = Actuacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actuacion_params
      params.require(:actuacion).permit(:numero, :fecha, :descripcion, :tipo, :juicio_id)
    end
end
