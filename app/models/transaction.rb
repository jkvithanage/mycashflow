class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  enum :transaction_type, { debit: 'debit', credit: 'credit' }, prefix: true

  scope :ordered, -> { order(date: :desc) }

  paginates_per 20
end
