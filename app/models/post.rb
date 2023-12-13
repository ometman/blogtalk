class Post < ApplicationRecord
    belongs_to :user, foreign_key: :author_id
    has_many :comment, dependent: :destroy
    has_many :like, dependent: :destroy
end
  