class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @debits = current_user.transactions.transaction_type_debit.group_by_month(:date, format: "%b %Y").sum(:amount)
    @credits = current_user.transactions.transaction_type_credit.group_by_month(:date, format: "%b %Y").sum(:amount)

    @labels = @debits.keys
    @series = [@debits.values, @credits.values]

    category_chart_data = current_user.transactions.group(:category).sum(:amount)
    @category_chart_labels = category_chart_data.keys.map(&:name)
    @category_chart_series = category_chart_data.values

    @transactions = Transaction.last(10)
  end
end
