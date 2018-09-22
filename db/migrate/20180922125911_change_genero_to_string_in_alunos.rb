class ChangeGeneroToStringInAlunos < ActiveRecord::Migration[5.2]
  def change
    change_column :alunos, :genero, :string
  end
end
