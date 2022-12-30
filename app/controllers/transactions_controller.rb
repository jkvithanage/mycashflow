class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
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

  private

  def transaction_params
    params.require(:transaction).permit(:date, :description, :tx_type, :tx_amount, :notes, :account_id, :category_id)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
