class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_enum :transaction_type, %w[debit credit]
    create_table :transactions do |t|
      t.datetime :date
      t.string :description
      t.enum(:transaction_type, enum_type: 'transaction_type', null: false)
      t.decimal :amount
      t.string :notes
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
