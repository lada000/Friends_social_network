class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :interests

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  after_update_commit -> { broadcast_replace_to "users" }

  def online!
    update!(status: true)
  end

  def offline!
    update!(status: false)
  end
end
