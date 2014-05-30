class EnsalamentosController < ApplicationController
  before_action :set_ensalamento, only: [:show, :edit, :update, :destroy]

  # GET /ensalamentos
  # GET /ensalamentos.json
  def index
    @ensalamentos = Ensalamento.all
  end

  # GET /ensalamentos/1
  # GET /ensalamentos/1.json
  def show
  end

  # GET /ensalamentos/new
  def new
    @ensalamento = Ensalamento.new
  end

  # GET /ensalamentos/1/edit
  def edit
  end

  # POST /ensalamentos
  # POST /ensalamentos.json
  def create
    @ensalamento = Ensalamento.new(ensalamento_params)

    respond_to do |format|
      if @ensalamento.save
        format.html { redirect_to @ensalamento, notice: 'Ensalamento was successfully created.' }
        format.json { render :show, status: :created, location: @ensalamento }
      else
        format.html { render :new }
        format.json { render json: @ensalamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ensalamentos/1
  # PATCH/PUT /ensalamentos/1.json
  def update
    respond_to do |format|
      if @ensalamento.update(ensalamento_params)
        format.html { redirect_to @ensalamento, notice: 'Ensalamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @ensalamento }
      else
        format.html { render :edit }
        format.json { render json: @ensalamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ensalamentos/1
  # DELETE /ensalamentos/1.json
  def destroy
    @ensalamento.destroy
    respond_to do |format|
      format.html { redirect_to ensalamentos_url, notice: 'Ensalamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ensalamento
      @ensalamento = Ensalamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ensalamento_params
      params.require(:ensalamento).permit(:disciplina_id, :sala_id, :periodo_id, :alunos, :final)
    end
end
