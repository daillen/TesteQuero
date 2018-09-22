class ChangeTipoToStringInInstituicaos < ActiveRecord::Migration[5.2]
  def change
    change_column :instituicaos, :tipo, :string
  end
end
