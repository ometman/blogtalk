class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :like do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end

    add_foreign_key :like, :user, column: :user_id
    add_foreign_key :like, :post, column: :post_id
    add_index :like, :user_id
    add_index :like, :post_id
  end
end
