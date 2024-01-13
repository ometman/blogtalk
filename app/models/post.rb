class Post < ApplicationRecord
  before_validation :set_default_counters
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  # title must not be blank
  validates :title, presence: true

  # title must not exceed 250 characters
  validates :title, length: { maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # LikesCounter must be an integer greater than or equal to zero
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_posts_counter

  private

  def set_default_counters
    self.comments_counter ||= 0
    self.likes_counter ||= 0
  end

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
