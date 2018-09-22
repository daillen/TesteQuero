class CreateFaturas < ActiveRecord::Migration[5.2]
  def change
    create_table :faturas do |t|
      t.decimal :valor, scale: 2
      t.date :vencimento
      t.references :matricula, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
