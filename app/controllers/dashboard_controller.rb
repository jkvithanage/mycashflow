class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    debits = Transaction.transaction_type_debit.group_by_month(:date, format: "%b %Y").sum(:amount)
    credits = Transaction.transaction_type_credit.group_by_month(:date, format: "%b %Y").sum(:amount)

    @labels = debits.keys
    @series = [debits.values, credits.values]
  end
end
