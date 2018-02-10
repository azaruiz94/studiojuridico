class ProcesosController < ApplicationController
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
    @detalles = ProcesoDetalle.where("proceso_id = ?", params[:id])
  end

  # GET /procesos/new
  def new
    @proceso = Proceso.new
    @tipos_procesos= TipoProceso.all
    @clientes = Cliente.all
    @empleados = Empleado.all
    @fases_rows = Fase.where("tipo_proceso_id = ?", params[:id])
    @fases= Fase.where('tipo_proceso_id = ?', params[:tipo_proceso_id])
    @estado= Fase.where("tipo_proceso_id = ?", params[:tipo_proceso_id]).pluck(:estado)[0]
    @fecha_ingreso= Time.now.strftime("%d/%m/%Y")
  end

  # GET /procesos/1/edit
  def edit
    @clientes = Cliente.all
    @tipos_procesos= TipoProceso.all
    @empleados = Empleado.all
    @detalles = ProcesoDetalle.where("proceso_id = ?", params[:id])
    @tipo_proceso = TipoProceso.find(Proceso.find(params[:id]).tipo_proceso_id).id
    @cliente = TipoProceso.find(Proceso.find(params[:id]).cliente_id).id
    @empleado = TipoProceso.find(Proceso.find(params[:id]).empleado_id).id
    @estado= Proceso.find(params[:id]).estado
    @fecha_ingreso= Proceso.find(params[:id]).fecha_ingreso.strftime("%d/%m/%Y")
    @fecha_salida= Proceso.find(params[:id]).fecha_salida.strftime("%d/%m/%Y")


  end

  # POST /procesos
  # POST /procesos.json
  def create
    @proceso = Proceso.new(proceso_params)
    i= 0
    respond_to do |format|
      if @proceso.save
        @fases_rows= Fase.where("tipo_proceso_id = ?", Proceso.last.tipo_proceso_id)
        @fases_rows.each do |fase|
          ProcesoDetalle.create(proceso_id: Proceso.last.id,
           etapa: Fase.where("tipo_proceso_id = ?", Proceso.last.tipo_proceso_id).pluck(:nombre)[i],
            estado: Fase.where("tipo_proceso_id = ?", Proceso.last.tipo_proceso_id).pluck(:estado)[i])
          i+=1
        end
        format.html { redirect_to edit_proceso_path(@proceso), notice: 'Proceso was successfully created.' }
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
    i= 0
    respond_to do |format|
      if @proceso.update(proceso_params)
        @detalles_rows= ProcesoDetalle.where("proceso_id = ?", @proceso.id)
        @detalles_rows.each do |detalle|
          detalle.update(
            proceso_id: @proceso.id,
           etapa: Fase.where("tipo_proceso_id = ?", @proceso.tipo_proceso_id).pluck(:nombre)[i],
           estado: Fase.where("tipo_proceso_id = ?", @proceso.tipo_proceso_id).pluck(:estado)[i])
          i+=1
        end
        format.html { redirect_to @proceso, notice: 'Proceso was successfully updated.' }
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
      format.html { redirect_to procesos_url, notice: 'Proceso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cargar_fases
    @fases= Fase.where('tipo_proceso_id = ?', params[:tipo_proceso_id])
    @tipo_selected= :tipo_proceso_id
    respond_to do |format|
      format.json {render json: @fases}
      format.html
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceso
      @proceso = Proceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceso_params
      params.require(:proceso).permit(:doc_numero,
        :referencia,
        :estado,
        :descripcion,
        :fecha_ingreso,
        :fecha_salida, 
        :cliente_id, 
        :tipo_proceso_id, 
        :empleado_id)
    end
end
