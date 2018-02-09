class TipoProcesosController < ApplicationController
  before_action :set_tipo_proceso, only: [:show, :edit, :update, :destroy]

  # GET /tipo_procesos
  # GET /tipo_procesos.json
  def index
    @tipo_procesos = TipoProceso.all
  end

  # GET /tipo_procesos/1
  # GET /tipo_procesos/1.json
  def show
    @fases_rows = Fase.where("tipo_proceso_id = ?", params[:id])
  end

  # GET /tipo_procesos/new
  def new
    @tipo_proceso = TipoProceso.new
  end

  # GET /tipo_procesos/1/edit
  def edit
    
  end

  # POST /tipo_procesos
  # POST /tipo_procesos.json
  def create
    @tipo_proceso = TipoProceso.new(tipo_proceso_params)
    respond_to do |format|
      if @tipo_proceso.save
        format.html { redirect_to @tipo_proceso, notice: 'Tipo proceso was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_proceso }
      else
        format.html { render :new }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_procesos/1
  # PATCH/PUT /tipo_procesos/1.json
  def update
    respond_to do |format|
      if @tipo_proceso.update(tipo_proceso_params)
        format.html { redirect_to @tipo_proceso, notice: 'Tipo proceso was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_proceso }
      else
        format.html { render :edit }
        format.json { render json: @tipo_proceso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_procesos/1
  # DELETE /tipo_procesos/1.json
  def destroy
    @tipo_proceso.destroy
    respond_to do |format|
      format.html { redirect_to tipo_procesos_url, notice: 'Tipo proceso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_proceso
      @tipo_proceso = TipoProceso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_proceso_params
      params.require(:tipo_proceso).permit(
        :nombre,
        :fases_attributes => [:id, :nombre, :estado, :_destroy])
    end
end
