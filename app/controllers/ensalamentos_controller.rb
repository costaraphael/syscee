class EnsalamentosController < ApplicationController
  before_action :check_acesso
  before_action :set_ensalamento, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [5]

    @ensalamentos = Ensalamento.all
  end

  def solicitados
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [2]

    @ensalamentos = @activeUser.solicitacoes.where('ativo = true')
  end

  def abertos
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [4]

    @ensalamentos = Ensalamento.where('final = false').where('ativo = true')
  end

  def fechados
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [4]

    @ensalamentos = Ensalamento.where('final = true').where('ativo = true')
  end

  def relatorios
    @periodo = Periodo.find params[:periodo]
    @ensalamentos = Ensalamento.find_by_periodo_id @periodo.id

    pdf = RelatorioEnsalamentos.new(@ensalamentos, @periodo)
    send_data pdf.render, filename: "Ensalamentos do periodo #{@periodo.nome}.pdf", type: 'application/pdf'
  end

# GET /ensalamentos/1
# GET /ensalamentos/1.json
  def show
    @logs = @ensalamento.logs
    @ensalamento.sugestoes.each do |sugestao|
      @logs << sugestao.logs
    end
  end

# GET /ensalamentos/new
  def new
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [2]

    @ensalamento = Ensalamento.new
  end

# GET /ensalamentos/1/edit
  def edit
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [4]
  end

# POST /ensalamentos
# POST /ensalamentos.json
  def create
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [2]

    @ensalamento = Ensalamento.new(ensalamento_params)
    @ensalamento.solicitante = @activeUser

    respond_to do |format|
      if @ensalamento.save
        @ensalamento.logs.create usuario: @activeUser, descricao: "Ensalamento solicitado para a disciplina de #{@ensalamento.disciplina.nome} com #{@ensalamento.alunos} alunos."
        format.html { redirect_to solicitados_ensalamentos_path, notice: 'Ensalamento solicitado com sucesso.' }
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
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [4]

    respond_to do |format|
      if @ensalamento.sala.nil? and !ensalamento_params[:sala_id].nil?
        efetuar = true
        @ensalamento.final = true
        @ensalamento.deferente = @activeuser
      end
      if @ensalamento.update(ensalamento_params)
        if efetuar
          @ensalamento.logs.create({usuario: @activeUser, descricao: "Ensalamento efetuado para a sala #{@ensalamento.sala.nome}."})
          format.html { redirect_to abertos_ensalamentos_path, notice: 'Ensalamento efetuado com sucesso.' }
        else
          @ensalamento.logs.create({usuario: @activeUser, descricao: "Ensalamento realocado para a sala #{@ensalamento.sala.nome}."})
          format.html { redirect_to fechados_ensalamentos_path, notice: 'Ensalamento realocado com sucesso.' }
        end
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
    @ensalamento.ativo = false unless @ensalamento.final

    @ensalamento.save
    @ensalamento.logs.create usuario: @activeUser, descricao: 'Ensalamento removido.'

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Ensalamento removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
# Use callbacks to share common setup or constraints between actions.
  def set_ensalamento
    @ensalamento = Ensalamento.find(params[:id])

    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [4, 5] or @ensalamento.solicitante == @activeUser
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def ensalamento_params
    params.require(:ensalamento).permit(:disciplina_id, :sala_id, :periodo_id, :alunos, :final)
  end

  def check_acesso
    redirect_to root_path unless @activeUser.tipo_usuario_id.in? [2, 4, 5]
  end

end
