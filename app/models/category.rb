class Category < ApplicationRecord
  has_many :interests, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

