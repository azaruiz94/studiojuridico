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
    @numero= 1
  end

  # GET /juicios/1/edit
  def edit
    @clientes = Cliente.all
    @empleados = Empleado.all
    @objetos = Objeto.all
    @cliente= Juicio.find(params[:id]).cliente_id
    @empleado= Juicio.find(params[:id]).empleado_id
    @objeto= Juicio.find(params[:id]).objeto_id
    @circunscripcion= Juicio.find(params[:id]).circunscripcion
    @tipo_proceso= Juicio.find(params[:id]).tipo_proceso
    
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
        :circunscripcion,
        :actuaciones_attributes => [:id, :numero, :fecha, :descripcion, :tipo, :_destroy])
    end
end
