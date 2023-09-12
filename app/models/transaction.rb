class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  enum :transaction_type, { debit: 'debit', credit: 'credit' }, suffix: :type

  scope :ordered, -> { order(date: :desc) }
  paginates_per 10

  after_commit :update_account_balance, on: %i[create update destroy]
  def update_account_balance
    account.update(current_balance: account.calculate_balance)
  end
end
