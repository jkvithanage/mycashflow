class RenameAccountColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :type, :acc_type
    rename_column :accounts, :name, :acc_name
  end
end
