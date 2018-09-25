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
      today = Date.today
      vencimento = Date.new(today.year, today.month, @matricula.vencimento_faturas)

      if vencimento > today
        vencimento = vencimento.next_month
      end

      valor_per_fatura = @matricula.valor_total / @matricula.qtd_faturas

      @matricula.qtd_faturas.times do
        Fatura.create(valor: valor_per_fatura,
                      vencimento: vencimento,
                      matricula: @matricula)
        vencimento = vencimento.next_month
      end

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
