class ChangeCnpjToStringInInstituicaos < ActiveRecord::Migration[5.2]
  def change
    change_column :instituicaos, :cnpj, :string
  end
end
