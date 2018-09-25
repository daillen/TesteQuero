class AddEmailColumnToAlunos < ActiveRecord::Migration[5.2]
  def change
    add_column :alunos, :email, :string
  end
end
