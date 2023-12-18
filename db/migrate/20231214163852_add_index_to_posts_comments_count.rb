class AddIndexToPostsCommentsCount < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :comments_counter
  end
end
