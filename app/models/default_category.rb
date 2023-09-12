class DefaultCategory < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: {
              message: 'Default Category already exists.',
              case_sensitive: false
            }
end
