class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name, presence: true, uniqueness: true

  scope :ordered, -> { order(id: :desc) }
end
