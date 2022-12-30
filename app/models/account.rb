class Account < ApplicationRecord
  has_many :transactions, dependent: :destroy

  enum :acc_type, [:Checking, :Savings]
  enum :bank_name, [:Westpac]
end
