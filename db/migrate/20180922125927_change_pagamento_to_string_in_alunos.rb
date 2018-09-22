class ChangePagamentoToStringInAlunos < ActiveRecord::Migration[5.2]
  def change
    change_column :alunos, :pagamento, :string
  end
end
