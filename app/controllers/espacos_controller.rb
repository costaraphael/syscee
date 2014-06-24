class EspacosController < ApplicationController
  before_action :set_espaco, only: [:show, :edit, :update, :destroy]
  before_action :check_acesso

  # GET /espacos
  # GET /espacos.json
  def index
    @espacos = Espaco.all
  end

  # GET /espacos/1
  # GET /espacos/1.json
  def show
  end

  # GET /espacos/new
  def new
    @espaco = Espaco.new
  end

  # GET /espacos/1/edit
  def edit
  end

  # POST /espacos
  # POST /espacos.json
  def create
    @espaco = Espaco.new(espaco_params)

    respond_to do |format|
      if @espaco.save
        format.html { redirect_to espacos_path, notice: 'Espaço criado com sucesso.' }
        format.json { render :show, status: :created, location: @espaco }
      else
        format.html { render :new }
        format.json { render json: @espaco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /espacos/1
  # PATCH/PUT /espacos/1.json
  def update
    respond_to do |format|
      if @espaco.update(espaco_params)
        format.html { redirect_to espacos_path, notice: 'Espaço atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @espaco }
      else
        format.html { render :edit }
        format.json { render json: @espaco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /espacos/1
  # DELETE /espacos/1.json
  def destroy
    @espaco.destroy
    respond_to do |format|
      format.html { redirect_to espacos_url, notice: 'Espaço removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_espaco
    @espaco = Espaco.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def espaco_params
    params.require(:espaco).permit(:nome)
  end

  def check_acesso
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [5, 3]
  end
end
