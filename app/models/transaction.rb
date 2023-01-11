class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  enum :tx_type, [:Debit, :Credit]

  scope :ordered, -> { order(date: :desc) }

  def self.update_account_balance(transaction)
    account = Account.find(transaction.account_id)
    if transaction.tx_type == 'Debit'
      account.current_balance -= transaction.tx_amount
    else
      account.current_balance += transaction.tx_amount
    end
    account.save
  end
end
