class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :name,
            presence: true,
            uniqueness: {
              scope: :user, message: 'Category is already exists.',
              case_sensitive: false
            }

  scope :ordered, -> { order(id: :desc) }
  paginates_per 10
end
