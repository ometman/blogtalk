class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy

  validates_uniqueness_of :name
  validates_uniqueness_of :email

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.recent_posts(user_name, limit = 3)
    user = find_by(name: user_name)
    return unless user

    user.posts.order(created_at: :desc).limit(limit)
  end
end
