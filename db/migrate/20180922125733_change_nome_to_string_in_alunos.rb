class ChangeNomeToStringInAlunos < ActiveRecord::Migration[5.2]
  def change
    change_column :alunos, :nome, :string
  end
end
