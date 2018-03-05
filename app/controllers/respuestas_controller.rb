class RespuestasController < ApplicationController
  load_and_authorize_resource
  before_action :set_respuesta, only: [:show, :edit, :update, :destroy]

  # GET /respuestas
  # GET /respuestas.json
  def index
    @respuestas = Respuesta.all
  end

  # GET /respuestas/1
  # GET /respuestas/1.json
  def show
  end

  # GET /respuestas/new
  def new
    @respuesta = Respuesta.new
    @proceso= params[:proceso_id]
    @cliente= Cliente.find(Proceso.find(params[:proceso_id]).cliente_id).nombre
    @correo= Cliente.find(Proceso.find(params[:proceso_id]).cliente_id).email
    @nro_nota= Proceso.find(params[:proceso_id]).doc_numero
    @titulo=Proceso.find(params[:proceso_id]).referencia 
    @referencia= String(@nro_nota) +" - "+ String(@titulo)
    puts @referencia
  end

  # GET /respuestas/1/edit
  def edit
  end

  # POST /respuestas
  # POST /respuestas.json
  def create
    @respuesta = Respuesta.new(respuesta_params)

    respond_to do |format|
      if @respuesta.save
        format.html { redirect_to @respuesta, notice: 'Respuesta was successfully created.' }
        format.json { render :show, status: :created, location: @respuesta }
      else
        format.html { render :new }
        format.json { render json: @respuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respuestas/1
  # PATCH/PUT /respuestas/1.json
  def update
    respond_to do |format|
      if @respuesta.update(respuesta_params)
        format.html { redirect_to @respuesta, notice: 'Respuesta was successfully updated.' }
        format.json { render :show, status: :ok, location: @respuesta }
      else
        format.html { render :edit }
        format.json { render json: @respuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respuestas/1
  # DELETE /respuestas/1.json
  def destroy
    @respuesta.destroy
    respond_to do |format|
      format.html { redirect_to respuestas_url, notice: 'Respuesta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respuesta
      @respuesta = Respuesta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respuesta_params
      params.require(:respuesta).permit(:memo, :fecha, :medios, :descripcion, :proceso_id)
    end
end
