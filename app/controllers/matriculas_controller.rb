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
    @matricula = Matricula.new(JSON.parse(request.body.read))
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
      }, status: :not_acceptable
    end
  end
end
