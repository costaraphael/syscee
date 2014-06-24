class SugestoesController < ApplicationController
  before_action :set_ensalamento
  before_action :set_sugestao, only: [:destroy]

  # GET /sugestaos
  # GET /sugestaos.json
  def index
    @sugestoes = @ensalamento.sugestoes
  end

  # GET /sugestaos/new
  def new
    @sugestao = @ensalamento.sugestoes.build
  end

  # POST /sugestaos
  # POST /sugestaos.json
  def create
    @sugestao = @ensalamento.sugestoes.create(sugestao_params)

    respond_to do |format|
      if @sugestao.save
        @sugestao.logs.create({usuario: @activeUser, descricao: "Sugestao adicionada para a sala #{@sugestao.sala.nome}."})
        format.html { redirect_to ensalamento_sugestoes_path(@ensalamento), notice: 'Sugestão adicionada com sucesso.' }
        format.json { render :show, status: :created, location: @sugestao }
      else
        format.html { render :new }
        format.json { render json: @sugestao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sugestaos/1
  # DELETE /sugestaos/1.json
  def destroy
    @sugestao.destroy
    respond_to do |format|
      format.html { redirect_to ensalamento_sugestoes_path(@ensalamento), notice: 'Sugestão removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sugestao
    @sugestao = Sugestao.find(params[:id])
  end

  def set_ensalamento
    @ensalamento = Ensalamento.find(params[:ensalamento_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sugestao_params
    params.require(:sugestao).permit(:sala_id)
  end
end
