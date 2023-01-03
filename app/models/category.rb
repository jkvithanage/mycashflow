class Category < ApplicationRecord
  has_many :transactions

  validates :name, presence: true, uniqueness: true

  scope :ordered, -> { order(id: :desc) }
end
