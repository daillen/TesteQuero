class CreateAlunos < ActiveRecord::Migration[5.2]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :nascimento
      t.integer :celular
      t.text :genero
      t.text :pagamento

      t.timestamps
    end
  end
end
