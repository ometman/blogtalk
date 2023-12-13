class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :post do |t|
      t.references :author, foreign_key: { to_table: :user }
      t.string :title
      t.text :text
      t.integer :likes_counter

      t.timestamps
    end

    add_index :post, :likes_counter
  end
end
