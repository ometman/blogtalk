class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :user do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.integer :posts_counter

      t.timestamps
    end

    add_index :user, :posts_counter
  end
end

