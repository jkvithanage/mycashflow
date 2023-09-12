class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  enum :account_type, { checking: 'checking', savings: 'savings' }, suffix: :type

  def calculate_balance
    transactions.credit_type.sum(&:amount) - transactions.debit_type.sum(&:amount)
  end
end
