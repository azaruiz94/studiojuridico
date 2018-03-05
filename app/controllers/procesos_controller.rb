class ProcesosController < ApplicationController
  load_and_authorize_resource
  before_action :set_proceso, only: [:show, :edit, :update, :destroy]
  @tipo_selected= 0

  # GET /procesos
  # GET /procesos.json
  def index
    @procesos = Proceso.all
  end

  # GET /procesos/1
  # GET /procesos/1.json
  def show
    @detalles = ProcesoDetalle.where("proceso_id = ?", params[:id]).order('numero desc')
  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
    @clientes = Cliente.all
    @empleados = Empleado.all
    @instituciones= Institucion.all

  end

  # GET /procesos/1/edit
  def edit
    @proceso_id= Proceso.find(params[:id])
    @clientes = Cliente.all
    @empleados = Empleado.all
    @detalles = ProcesoDetalle.where("proceso_id = ?", params[:id]).order('numero desc')
    @cliente = Cliente.find(Proceso.find(params[:id]).cliente_id).id
    @empleado = Empleado.find(Proceso.find(params[:id]).empleado_id).id
    @estado= Proceso.find(params[:id]).estado
    @fecha_ingreso= Proceso.find(params[:id]).fecha_ingreso.strftime("%d/%m/%Y")
    @instituciones= Institucion.all
  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(proceso_params)
    @clientes = Cliente.all
    respond_to do |format|
      if @proceso.save
        format.html { redirect_to @proceso, notice: 'El proceso fue creado con éxito.' }
        format.json { render :show, status: :created, location: @proceso }
      else
        format.html { render :new }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procesos/1
  # PATCH/PUT /procesos/1.json
  def update
    respond_to do |format|
      if @proceso.update(proceso_params)
        format.html { redirect_to @proceso, notice: 'El proceso due actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @proceso }
      else
        format.html { render :edit }
        format.json { render json: @proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procesos/1
  # DELETE /procesos/1.json
  def destroy
    @proceso.destroy
    respond_to do |format|
      format.html { redirect_to procesos_url, notice: 'El proceso fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_params
      params.require(:proceso).permit(
        :doc_numero,
        :referencia,
        :estado,
        :descripcion,
        :fecha_ingreso,
        :fecha_salida, 
        :cliente_id,
        :empleado_id,
        :institucion_id,
        :proceso_detalles_attributes => [:id, :numero, :lugar, :fecha_entrada, :fecha_salida, :_destroy])
    end

end
