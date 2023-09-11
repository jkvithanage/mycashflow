class User < ApplicationRecord
  has_many :accounts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :transactions, through: :accounts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
