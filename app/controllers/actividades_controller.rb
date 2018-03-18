class ActividadesController < ApplicationController
  before_action :set_actividad, only: [:show, :edit, :update, :destroy]

  # GET /actividades
  # GET /actividades.json
  def index
    @actividades = Actividad.where("fin > ?", Time.now().utc)
    @todas= Actividad.all
    @filterrific = initialize_filterrific(
    Actividad,
    params[:filterrific],
    select_options: {

    },
     persistence_id: false
    ) or return
    @todas = @filterrific.find.page(params[:page]).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
      format.html
      format.json
    end
    #@mes= Date.today().month
    #@anho= Date.today().year
    #@dias= Time.days_in_month(@month, @anho)
  end

  # GET /actividades/1
  # GET /actividades/1.json
  def show
  end

  # GET /actividades/new
  def new
    @actividad = Actividad.new
  end

  # GET /actividades/1/edit
  def edit
    @fecha= Actividad.find(params[:id]).inicio.strftime("%d/%m/%Y %H:%M")
  end

  def posponer
    @actividad= Actividad.find(params[:id])
    puts @actividad
  end

  # POST /actividades
  # POST /actividades.json
  def create
    @actividad = Actividad.new(actividad_params)
    anho= @actividad.fin.year
    mes= @actividad.fin.month
    dia= @actividad.fin.day
    hora= @actividad.fin.hour
    min= @actividad.fin.min
    seg= @actividad.fin.sec
    @actividad.inicio= Time.zone.local(anho, mes, dia, hora, min, seg).utc
    @actividad.fin= Time.zone.local(anho, mes, dia, 23, 59, 00).utc
    respond_to do |format|
      if @actividad.save

        format.html { redirect_to @actividad, notice: 'Actividad was successfully created.' }
        format.json { render :show, status: :created, location: @actividad }
      else
        format.html { render :new }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actividades/1
  # PATCH/PUT /actividades/1.json
  def update
    anho= @actividad.fin.year
    mes= @actividad.fin.month
    dia= @actividad.fin.day
    hora= @actividad.fin.hour
    min= @actividad.fin.min
    seg= @actividad.fin.sec
    @actividad.inicio= Time.zone.local(anho, mes, dia, hora, min, seg).utc
    @actividad.fin= Time.zone.local(anho, mes, dia, 23, 59, 00).utc
    respond_to do |format|
      if @actividad.update(actividad_params)
        format.html { redirect_to @actividad, notice: 'Actividad was successfully updated.' }
        format.json { render :show, status: :ok, location: @actividad }
      else
        format.html { render :edit }
        format.json { render json: @actividad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.json
  def destroy
    @actividad.destroy
    respond_to do |format|
      format.html { redirect_to actividades_url, notice: 'Actividad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actividad
      @actividad = Actividad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actividad_params
      params.require(:actividad).permit(:nombre, :descripcion, :inicio, :fin)
    end
end
