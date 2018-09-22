class CreateMatriculas < ActiveRecord::Migration[5.2]
  def change
    create_table :matriculas do |t|
      t.decimal :valor_total, scale: 2
      t.integer :qtd_faturas
      t.integer :vencimento_faturas
      t.text :curso
      t.references :instituicao, foreign_key: true
      t.references :aluno, foreign_key: true

      t.timestamps
    end
  end
end
