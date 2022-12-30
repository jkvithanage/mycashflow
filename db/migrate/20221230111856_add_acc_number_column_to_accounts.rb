class AddAccNumberColumnToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :acc_number, :string
  end
end
