class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category

  enum :tx_type, [:Debit, :Credit]
end
