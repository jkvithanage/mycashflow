class ChangeBankNameFromEnumToString < ActiveRecord::Migration[7.0]
  def change
    remove_column :accounts, :bank_name
    add_column :accounts, :bank_name, :string
  end
end
