require 'csv'

class ImportTransactionsService
  def call(file, acc_id)
    CSV.foreach(file.path, headers: true) do |row|
      tx_hash = Transaction.new
      tx_hash.account_id = acc_id
      tx_hash.date = row[1]
      tx_hash.description = row[2]
      if row[3].nil?
        tx_hash.tx_type = 'Credit'
        tx_hash.tx_amount = row[4]
      else
        tx_hash.tx_type = 'Debit'
        tx_hash.tx_amount = row[3]
      end
      tx_hash.category_id = 1
      tx_hash.save
    end
  end
end
