class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :transactions, through: :accounts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def calculate_total_debit
    transactions.debit_type.sum(&:amount)
  end

  def calculate_total_credit
    transactions.credit_type.sum(&:amount)
  end
end
