class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, uniqueness: { scope: :friend_id, message: "Friendship already exists" }
  
  scope :pending, -> { where(status: "pending") }
end
