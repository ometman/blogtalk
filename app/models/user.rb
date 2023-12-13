class User < ApplicationRecord
    has_many :post, foreign_key: :author_id, dependent: :destroy
    has_many :comment, dependent: :destroy
    has_many :like, dependent: :destroy
end
  