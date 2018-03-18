class JuiciosController < ApplicationController
  load_and_authorize_resource
  before_action :set_juicio, only: [:show, :edit, :update, :destroy]

  # GET /juicios
  # GET /juicios.json
  def index
    @juicios = Juicio.all
    
  end

  # GET /juicios/1
  # GET /juicios/1.json
  def show
    @actuaciones= Actuacion.where("juicio_id = ?", params[:id])
  end

  # GET /juicios/new
  def new
    @juicio = Juicio.new
    @clientes = Cliente.all
    @empleados = Empleado.all
    @objetos = Objeto.all
    @circunscripciones = Circunscripcion.all
    @estados= Estado.all
    @numero= 1
  end

  # GET /juicios/1/edit
  def edit
    juicio= Juicio.find(params[:id])
    @clientes = Cliente.all
    @empleados = Empleado.all
    @objetos = Objeto.all
    @circunscripciones = Circunscripcion.all
    @estados= Estado.all
    @cliente= juicio.cliente_id
    @empleado= juicio.empleado_id
    @objeto= juicio.objeto_id
    @circunscripcion= juicio.circunscripcion_id
    @estado= juicio.estado_id
    @proceso= juicio.proceso
    @tipo_proceso= juicio.tipo_proceso
    
  end

  # POST /juicios
  # POST /juicios.json
  def create
    @juicio = Juicio.new(juicio_params)

    respond_to do |format|
      if @juicio.save
        format.html { redirect_to @juicio, notice: 'El proceso fue creado con éxito.' }
        format.json { render :show, status: :created, location: @juicio }
      else
        format.html { render :new }
        format.json { render json: @juicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /juicios/1
  # PATCH/PUT /juicios/1.json
  def update
    respond_to do |format|
      if @juicio.update(juicio_params)
        format.html { redirect_to @juicio, notice: 'El proceso fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @juicio }
      else
        format.html { render :edit }
        format.json { render json: @juicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /juicios/1
  # DELETE /juicios/1.json
  def destroy
    @juicio.destroy
    respond_to do |format|
      format.html { redirect_to juicios_url, notice: 'El juicio fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  def cargar_select
    @rows= Objeto.where("proceso ILIKE ? and tipo_proceso ILIKE ?", params[:proceso], params[:tipo_proceso])
    respond_to do |format|
      format.json {render json: @rows}
    end
  end

  def report
    @juicios_table = Juicio.all 
    @filterrific = initialize_filterrific(
    Juicio,
    params[:filterrific],
    select_options: {
      sorted_by_estado: Estado.options_for_sorted_by_estado
      },
     persistence_id: false
    ) or return
    @juicios_table = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def imprimir
    @juicio= Juicio.find(params[:id])
    @actuaciones= Actuacion.where("juicio_id = ?", params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juicio
      @juicio = Juicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juicio_params
      params.require(:juicio).permit(
        :exp_numero,
        :caratula,
        :fiscal,
        :proceso,
        :tipo_proceso,
        :cliente_id,
        :empleado_id,
        :objeto_id,
        :estado_id,
        :circunscripcion_id,
        :actuaciones_attributes => [:id, :numero, :fecha, :descripcion, :tipo, :_destroy])
    end
end
