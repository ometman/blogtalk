class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  private

  def increment_post_comments_counter
    post.increment(:comments_counter).save
  end

  def decrement_post_comments_counter
    post.decrement(:comments_counter).save
  end
end
