require 'csv'

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
    if params[:transaction][:file].present?
      import(params[:transaction][:file])
      flash[:notice] = "File uploaded successfully"
      redirect_to transactions_path
    else
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        redirect_to transactions_path, notice: "Transaction was succesfully created."
      else
        render :new, status: :unprocessable_entity
      end
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
    params.require(:transaction).permit(:date, :description, :tx_type, :tx_amount, :notes, :account_id, :category_id, :file)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def import(file)
    CSV.foreach(file.path, headers: true) do |row|
      tx_hash = Transaction.new
      tx_hash.account_id = params[:transaction][:account_id]
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
