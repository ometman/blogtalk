class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comment do |t|
      t.integer :user_id
      t.integer :post_id
      t.text :text

      t.timestamps
    end

    add_foreign_key :comment, :user, column: :user_id
    add_foreign_key :comment, :post, column: :post_id
    add_index :comment, :user_id
    add_index :comment, :post_id
  end
end
