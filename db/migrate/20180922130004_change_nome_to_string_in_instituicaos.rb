class ChangeNomeToStringInInstituicaos < ActiveRecord::Migration[5.2]
  def change
    change_column :instituicaos, :nome, :string
  end
end
