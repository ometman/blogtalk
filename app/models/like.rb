class Like < ApplicationRecord
    belongs_to :post
    belongs_to :user

    after_create :increment_posts_likes_counter
    after_destroy :decrement_posts_likes_counter

    private

    def increment_posts_likes_counter
      post.increment(:likes_counter)
    end

    def decrement_posts_likes_counter
      post.decrement(:likes_counter)
    end
end