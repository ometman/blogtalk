class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    after_create :increment_user_posts_counter
    after_destroy :decrement_user_posts_counter

    private

    def increment_user_posts_counter
      author_increment(:posts_counter)
    end

    def decrement_user_posts_counter
      auhor_decrement(:posts_counter)
    end

    public

    def recent_comments(limit = 5)
      comments.order(created_at: :desc).limit(limit)
    end
end
  