class Category < ApplicationRecord
  has_many :productos, dependent: :restrict_with_error

  validates :nombre, presence: true, uniqueness: true
end
