class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: [:show, :edit, :update, :destroy]
  before_action :get_curso

  # GET /disciplinas
  # GET /disciplinas.json
  def index
    @disciplinas = @curso.disciplinas
  end

  # GET /disciplinas/1
  # GET /disciplinas/1.json
  def show
  end

  # GET /disciplinas/new
  def new
    @disciplina = Disciplina.new
  end

  # GET /disciplinas/1/edit
  def edit
  end

  # POST /disciplinas
  # POST /disciplinas.json
  def create
    @disciplina = @curso.disciplinas.create(disciplina_params)

    respond_to do |format|
      if @disciplina.save
        format.html { redirect_to curso_disciplinas_path, notice: 'Disciplina criada com sucesso.' }
        format.json { render :show, status: :created, location: @disciplina }
      else
        format.html { render :new }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplinas/1
  # PATCH/PUT /disciplinas/1.json
  def update
    respond_to do |format|
      if @disciplina.update(disciplina_params)
        format.html { redirect_to curso_disciplinas_path, notice: 'Disciplina atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @disciplina }
      else
        format.html { render :edit }
        format.json { render json: @disciplina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinas/1
  # DELETE /disciplinas/1.json
  def destroy
    @disciplina.destroy
    respond_to do |format|
      format.html { redirect_to curso_disciplinas_path, notice: 'Disciplina removida com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_disciplina
    @disciplina = Disciplina.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def disciplina_params
    params.require(:disciplina).permit(:nome, :curso_id, :professor_id)
  end

  def get_curso
    @curso = Curso.find(params[:curso_id]);
  end
end
