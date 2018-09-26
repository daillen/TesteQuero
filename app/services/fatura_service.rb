class FaturaService
  def initialize(params)
    @dia_vencimento = params[:dia_vencimento]
    @valor_total = params[:valor_total]
    @matricula_id = params[:matricula_id]
    @qtd_faturas = params[:qtd_faturas]
  end

  attr_writer :valor_total, :qtd_faturas, :dia_vencimento

  def create_faturas
    @qtd_faturas.times.collect do
      Fatura.new(valor: get_valor_per_fatura,
                 vencimento: get_vencimentos(Date.today).next,
                 matricula_id: @matricula_id)
    end
  end

  private
    def get_vencimentos(first_date)
      if first_date.day > @dia_vencimento
        first_date = first_date.next_month
      end

      reference = Date.new(first_date.year, first_date.month)

      Enumerator.new do |enum|
        @qtd_faturas.times do
          last_day_month = (reference.next_month - 1).day
          if last_day_month < @dia_vencimento
            enum.yield Date.new(reference.year, reference.month, last_day_month)
          else
            enum.yield Date.new(reference.year, reference.month, @dia_vencimento)
          end
          reference = reference.next_month
        end
      end
    end

    def get_valor_per_fatura
      # When the division results in repeating decimals or more than 2
      # decimal places always round up so that the total value is never less
      # than the one specified in the matricula.
      # Ex: 51.5416666... rounds to 51.55 instead of 51.54
      ((@valor_total.to_f / @qtd_faturas) * 100.0).ceil / 100.0
    end
end