class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :increment_post_likes_counter
  after_destroy :decrement_post_likes_counter

  private

  def increment_post_likes_counter
    post.increment(:likes_counter).save
  end

  def decrement_post_likes_counter
    post.decrement(:likes_counter).save
  end
end
