class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:import, :read]

  def index
    @transactions = policy_scope(Transaction).ordered
  end

  def show
  end

  def new
    @transaction = Transaction.new
    authorize @transaction
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.category = Category.find_or_create_by(name: 'Uncategorized', user: current_user) if params[:transaction][:category].nil?
    if @transaction.save
      Transaction.update_account_balance(@transaction)
      redirect_to transactions_path, notice: "Transaction was succesfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: "Transaction was succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    redirect_to transactions_path, status: :see_other, alert: "Transaction was deleted successfully."
  end

  def read
    @transaction = Transaction.new
  end

  def import
    file = params[:transaction][:file]
    if file.content_type == 'text/csv'
      ImportTransactionsService.new.call(file, params[:transaction][:account_id])
      redirect_to transactions_path, notice: 'Transactions imported successfully.'
    else
      redirect_to new_transaction_path, notice: 'Only CSV files accepted.'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:date, :description, :transaction_type, :amount, :notes, :account_id, :category_id, :file)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end
end
