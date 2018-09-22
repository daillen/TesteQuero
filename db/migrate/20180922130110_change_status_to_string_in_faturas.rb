class ChangeStatusToStringInFaturas < ActiveRecord::Migration[5.2]
  def change
    change_column :faturas, :status, :string
  end
end
