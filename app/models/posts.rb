class Posts < ApplicationRecord
    belongs_to :users, foreign_key: :author_id
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
  