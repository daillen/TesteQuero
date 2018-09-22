class CreateInstituicaos < ActiveRecord::Migration[5.2]
  def change
    create_table :instituicaos do |t|
      t.text :nome
      t.text :cnpj
      t.text :tipo

      t.timestamps
    end
  end
end
