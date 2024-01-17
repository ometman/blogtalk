class RemoveTextFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :text
  end
end
