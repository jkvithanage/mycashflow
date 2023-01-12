class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = policy_scope(Account)
  end

  def show
  end

  def new
    @account = Account.new
    authorize @account
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    authorize @account

    if @account.save
      redirect_to accounts_path, notice: "Account was succesfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to accounts_path, notice: "Account was succesfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: "Account was deleted successfully."
  end

  private

  def account_params
    params.require(:account).permit(:acc_name, :acc_type, :acc_number, :bank_name, :owner_name, :current_balance)
  end

  def set_account
    @account = Account.find(params[:id])
    authorize @account
  end
end
