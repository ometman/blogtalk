class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    after_create :increment_posts_comments_counter
    after_destroy :decrement_posts_comments_counter

    private

    def increment_posts_comments_counter
      post.increment(:posts_counter)
    end

    def decrement_posts_comments_counter
      post.decrement(:posts_counter)
    end
end