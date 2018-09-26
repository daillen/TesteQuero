class MatriculasController < ApplicationController
  def index
    render json: Matricula.all
  end

  def show
    @matricula = Matricula.find(params[:id])
    render json: @matricula, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
        error: e.to_s
    }, status: :not_found
  end

  def create
    @matricula = Matricula.new(get_params)
    if @matricula.save
      fatura_service = FaturaService.new(
          dia_vencimento: @matricula.vencimento_faturas,
          valor_total: @matricula.valor_total,
          qtd_faturas: @matricula.qtd_faturas,
          matricula_id: @matricula.id
      )

      fatura_service.create_faturas.each do |fatura|
        unless fatura.save
          render json: {
              error: fatura.errors.full_messages
          }, status: :unprocessable_entity
          # If a fatura fails to save, the matricula must be removed from the
          # database
          @matricula.delete
          return
        end
      end

      MatriculaMailer.matricula_email(@matricula).deliver_now

      render json: @matricula, status: :ok
    else
      render json: {
          error: @matricula.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def get_params
      params.require(:matricula).permit(:valor_total,
                                        :qtd_faturas,
                                        :vencimento_faturas,
                                        :curso,
                                        :instituicao_id,
                                        :aluno_id)
    end
end
