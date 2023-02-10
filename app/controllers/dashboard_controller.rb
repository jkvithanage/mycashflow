class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    groups = Transaction.all.group_by { |tx| tx.date.strftime("%B") }
    @labels = groups.keys
    debits, credits = [], []
    groups.values.each do |month|
      debit, credit = 0, 0
      month.each do |tx|
        tx.transaction_type == 'debit' ? debit += tx.amount : credit += tx.amount
      end
      debits << debit
      credits << credit
    end
    @series = [debits, credits]
  end
end
