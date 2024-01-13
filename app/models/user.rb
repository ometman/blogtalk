class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.recent_posts(user_name, limit = 3)
    user = find_by(name: user_name)
    return unless user

    user.posts.order(created_at: :desc).limit(limit)
  end

  def all_posts
    @user = User.find_by(name: params[:id])
    @posts = User.all_posts(@user.name)
  end
end
