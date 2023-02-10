class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_enum :account_type, %w[checking savings]
    create_enum :bank_name, %w[westpac commonwealth anz nab]
    create_table :accounts do |t|
      t.string :name
      t.enum(:account_type, enum_type: 'account_type', null: false)
      t.enum(:bank_name, enum_type: 'bank_name', null: false)
      t.string :account_number
      t.string :owner_name
      t.decimal :current_balance

      t.timestamps
    end
  end
end
