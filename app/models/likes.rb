class Likes < ApplicationRecord
    belongs_to :posts
    belongs_to :users
end