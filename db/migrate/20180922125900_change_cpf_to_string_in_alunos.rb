class ChangeCpfToStringInAlunos < ActiveRecord::Migration[5.2]
  def change
    change_column :alunos, :cpf, :string
  end
end
