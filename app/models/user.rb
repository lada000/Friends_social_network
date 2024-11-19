class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :categories

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

  def perfect_matches
    User.joins(:categories)
        .where(categories: { id: category_ids })
        .where.not(id: id)
        .group("users.id")
        .having("COUNT(categories.id) >= 7")
        .select("users.*, COUNT(categories.id) AS shared_categories_count")
        .order("shared_categories_count DESC")
  end

  def potential_friends
    User.joins(:categories)
        .where(categories: { id: category_ids })
        .where.not(id: id)
        .group("users.id")
        .having("COUNT(categories.id) BETWEEN 5 AND 6")
        .select("users.*, COUNT(categories.id) AS shared_categories_count")
        .order("shared_categories_count DESC")
  end

  def self.update_offline_status
    where("last_active_at < ?", 10.minutes.ago).update_all(status: false)
  end
end
