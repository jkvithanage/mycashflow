class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :type, default: 0
      t.string :name
      t.integer :bank_name, default: 0
      t.string :owner_name
      t.decimal :current_balance

      t.timestamps
    end
  end
end
