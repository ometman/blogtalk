class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
