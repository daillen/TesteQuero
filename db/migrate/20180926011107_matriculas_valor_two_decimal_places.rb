class MatriculasValorTwoDecimalPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :matriculas, :valor_total, :decimal, precision: 11, scale: 2
  end
end
