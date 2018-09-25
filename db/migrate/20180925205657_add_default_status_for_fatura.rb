class AddDefaultStatusForFatura < ActiveRecord::Migration[5.2]
  def change
    change_column_default :faturas, :status, "Aberta"
  end
end
