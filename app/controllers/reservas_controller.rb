class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]

  def solicitadas
    @reservas = Reserva.where('solicitante_id = ?', @activeUser.id)
  end

  def abertas
    @reservas = Reserva.where('status = 1')
  end

  def fechadas
    @reservas = Reserva.where('status > 1')
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)
    @reserva.status = 1
    @reserva.solicitante = @activeUser

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to solicitadas_reservas_path, notice: 'Reserva solicitada com sucesso.' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    @reserva.deferente = @activeUser

    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to abertas_reservas_path, notice: 'Reserva fechada com sucesso.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Reserva excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:espaco_id, :inicio, :fim, :status, :descricao)
    end
end
