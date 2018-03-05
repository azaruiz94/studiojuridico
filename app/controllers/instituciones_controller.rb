class InstitucionesController < ApplicationController
  load_and_authorize_resource
  before_action :set_institucion, only: [:show, :edit, :update, :destroy]

  # GET /instituciones
  # GET /instituciones.json
  def index
    @instituciones = Institucion.all
    
  end

  # GET /instituciones/1
  # GET /instituciones/1.json
  def show
  end

  # GET /instituciones/new
  def new
    @institucion = Institucion.new
    @ciudades= Ciudad.all
  end

  # GET /instituciones/1/edit
  def edit
    @ciudades= Ciudad.all
    @ciudad= Institucion.find(params[:id]).ciudad_id
  end

  # POST /instituciones
  # POST /instituciones.json
  def create
    @institucion = Institucion.new(institucion_params)

    respond_to do |format|
      if @institucion.save
        format.html { redirect_to @institucion, notice: 'Institucion was successfully created.' }
        format.json { render :show, status: :created, location: @institucion }
      else
        format.html { render :new }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instituciones/1
  # PATCH/PUT /instituciones/1.json
  def update
    respond_to do |format|
      if @institucion.update(institucion_params)
        format.html { redirect_to @institucion, notice: 'Institucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @institucion }
      else
        format.html { render :edit }
        format.json { render json: @institucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instituciones/1
  # DELETE /instituciones/1.json
  def destroy
    @institucion.destroy
    respond_to do |format|
      format.html { redirect_to instituciones_url, notice: 'Institucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institucion
      @institucion = Institucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def institucion_params
      params.require(:institucion).permit(:nombre, :direccion, :telefonoA, :telefonoB, :email, :ruc, :autoridad, :ciudad_id)
    end
end
