class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  enum :account_type, { checking: 'checking', savings: 'savings' }, prefix: true
  enum :bank_name, { westpac: 'westpac', commonwealth: 'commonwealth', anz: 'anz', nab: 'nab' }, prefix: true
end
