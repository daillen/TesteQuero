class FaturasValorTwoDecimalPlaces < ActiveRecord::Migration[5.2]
  def change
    change_column :faturas, :valor, :decimal, precision: 11, scale: 2
  end
end
