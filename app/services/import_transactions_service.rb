require 'csv'

class ImportTransactionsService
  def call(file, acc_id)
    account = Account.find(acc_id)
    user = account.user
    CSV.foreach(file.path, headers: true) do |row|
      tx_hash = Transaction.new
      tx_hash.account = account
      tx_hash.date = row[1]
      tx_hash.description = row[2]
      if row[3].nil?
        tx_hash.transaction_type = 'credit'
        tx_hash.amount = row[4]
      else
        tx_hash.transaction_type = 'debit'
        tx_hash.amount = row[3]
      end
      tx_hash.category = if user.categories.find_by(name: 'Imported').present?
                          user.categories.find_by(name: 'Imported')
                         else
                          Category.create(name: 'Imported', user:)
                         end
      tx_hash.save
    end
  end
end
