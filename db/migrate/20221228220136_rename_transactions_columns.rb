class RenameTransactionsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :type, :tx_type
    rename_column :transactions, :amount, :tx_amount
  end
end
