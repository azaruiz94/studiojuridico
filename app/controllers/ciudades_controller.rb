class CiudadesController < ApplicationController
  load_and_authorize_resource
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
  def index
    @ciudades = Ciudad.all
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
  end

  # GET /ciudades/new
  def new
    @ciudad = Ciudad.new
    @departamentos= Departamento.all
  end

  # GET /ciudades/1/edit
  def edit
    @departamentos= Departamento.all
    @departamento= Ciudad.find(params[:id]).departamento_id
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudad = Ciudad.new(ciudad_params)

    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to ciudades_url, notice: 'La ciudad fue creada con éxito.' }
        format.json { render :show, status: :created, location: @ciudad }
      else
        format.html { redirect_to new_ciudad_path, alert: 'La ciudad ya existe en la base de datos' }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudades/1
  # PATCH/PUT /ciudades/1.json
  def update
    respond_to do |format|
      if @ciudad.update(ciudad_params)
        format.html { redirect_to ciudades_url, notice: 'La ciudad fue actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @ciudad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1
  # DELETE /ciudades/1.json
  def destroy
    @ciudad.destroy
    respond_to do |format|
      format.html { redirect_to ciudades_url, notice: 'La ciudad fue eliminada con éxito.' }
      format.json { head :no_content }
    end
  end

  def check_uniqueness
    @data= Ciudad.where("nombre ILIKE ?", params[:nombre]).count
    respond_to do |format|
      format.json {render json: @data}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad
      @ciudad = Ciudad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      params.require(:ciudad).permit(:nombre, :departamento_id)
    end
end
