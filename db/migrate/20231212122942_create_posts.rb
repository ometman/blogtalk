class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.string :title
      t.text :text
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :likes_counter

      t.timestamps
    end

    add_index :posts, :author_id
    add_index :posts, :likes_counter
  end
end
